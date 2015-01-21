require_relative '../main'
require 'minitest'

class TestRunner
  include Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end
end

runner = TestRunner.new
Dir[File.expand_path('test-*.rb', __dir__)].each{|path|
  input, expected_output = File.read(path).split("\n'---'\n")
  actual_output = sort(input)
  runner.assert_equal(expected_output, actual_output, "Failed: #{File.basename(path)}")
}
