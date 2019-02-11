require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'matrix'

STest = SMatrix

class TestConversions<Test::Unit::TestCase
	# this is to test all of the functions in the builder module for smatrix
	@@maxsize = 100

	def setup
		# start setting up the variables for the test cases
		# NOTE: some of these "to_i" must be confirmed in another test
	end

	def test_upper_triangle

	end

	def test_upper_triangle!

	end

	def test_lower_triangle

	end

	def test_lower_triangle!

	end

end