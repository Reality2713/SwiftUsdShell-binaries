#!/usr/bin/env ruby
# frozen_string_literal: true

source = File.read(File.expand_path("../Package.swift", __dir__))
abort "missing SwiftUsdShellRuntime product" unless source.include?('name: "SwiftUsdShellRuntime"')
abort "runtime version is not semantic" unless source.match?(/let runtimeVersion = "\d+\.\d+\.\d+"/)

entries = source.scan(/\("([^"]+)", "([^"]+)", "([0-9a-f]{64})"\)/)
abort "runtime artifact set is empty" if entries.empty?
abort "duplicate runtime asset" unless entries.map { |entry| entry[1] }.uniq.length == entries.length
abort "duplicate runtime target" unless entries.map { |entry| entry[0] }.uniq.length == entries.length

puts "SwiftUsdShell runtime manifest: #{entries.length} artifacts"
