require "bundler/gem_tasks"

desc "Run tests"
task :test do
  require "ruby_code_sort"
  require "minitest/autorun"

  class TestRubyCodeSort < Minitest::Test
    def test_cases
      Dir[File.expand_path("test/test-*.rb", __dir__)].each{|path|
        input, expected_output = File.read(path).split("\n'---'\n")
        actual_output = RubyCodeSort.sort(input)
        assert_equal(expected_output, actual_output, "Failed: #{File.basename(path)}")
      }
    end
  end
end
