require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'matrix'

STest = SMatrix

class TestBuilder<Test::Unit::TestCase
	# this is to test all of the functions in the builder module for smatrix
	@@maxsize = 100

	def setup
		# start setting up the variables for the test cases
		@row = @col = (rand * @@maxsize).to_i
		#@eye = STest.
	end

	def test_I
		# This test will cover both the "I" and the "Eye" functions in the module

	end

	def test_zero

	end

	def test_random

	end

	def test_tridiagonal

	end

	def test_partition

	end

end