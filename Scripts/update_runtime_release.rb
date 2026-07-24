#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"

options = {}
OptionParser.new do |parser|
  parser.on("--version VERSION") { |value| options[:version] = value }
  parser.on("--checksums PATH") { |value| options[:checksums] = value }
  parser.on("--artifacts PATH") { |value| options[:artifacts] = value }
  parser.on("--package PATH") { |value| options[:package] = value }
end.parse!

required = %i[version checksums artifacts package]
missing = required.reject { |key| options[key] }
abort "missing options: #{missing.join(", ")}" unless missing.empty?
abort "version must be semantic" unless options[:version].match?(/\A\d+\.\d+\.\d+\z/)

checksums = File.readlines(options[:checksums], chomp: true).to_h do |line|
  name, checksum = line.split(/\s+/, 2)
  abort "invalid checksum line: #{line}" unless name && checksum&.match?(/\A[0-9a-f]{64}\z/)
  [name, checksum]
end

excluded = %w[OpenUSD OpenUSDInterfaces]
artifacts = Dir.glob(File.join(options[:artifacts], "*.xcframework.zip")).filter_map do |path|
  filename = File.basename(path)
  suffix = "-#{options[:version]}.xcframework.zip"
  abort "unexpected artifact filename: #{filename}" unless filename.end_with?(suffix)
  asset = filename.delete_suffix(suffix)
  next if excluded.include?(asset)

  checksum = checksums.fetch(asset) { abort "missing checksum for #{asset}" }
  [asset, "#{asset}_xcframework", checksum]
end.sort_by(&:first)

abort "runtime artifact set is empty" if artifacts.empty?
%w[SwiftUsdShell SwiftUsdShellOpenUSD _OpenUSD_SwiftBindingHelpers].each do |required_asset|
  abort "missing required runtime artifact #{required_asset}" unless artifacts.any? { |entry| entry[0] == required_asset }
end

package_path = options[:package]
source = File.read(package_path)
source.sub!(/let runtimeVersion = "[^"]+"/, "let runtimeVersion = \"#{options[:version]}\"") ||
  abort("runtimeVersion declaration not found")

rows = artifacts.map do |asset, suffix, checksum|
  "    (\"#{suffix}\", \"#{asset}\", \"#{checksum}\"),"
end.join("\n")

pattern = /let runtimeArtifacts = \[\n.*?\n\]\nlet runtimeTargetNames/m
replacement = "let runtimeArtifacts = [\n#{rows}\n]\nlet runtimeTargetNames"
source.sub!(pattern, replacement) || abort("runtimeArtifacts declaration not found")
File.write(package_path, source)
