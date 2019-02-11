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
		@row = @col = (rand * @@maxsize).to_i
		@eye = STest.I(@row)
		@rand = STest.random(@row, @col).to_i
		@zero = STest.zero(@row, @col)
	end

	def test_to_string
		# ensure that the output is string type
	end

	def test_to_arrays
		#ensure that the values in the arrays match up with the original matrix
	end

	def test_to_float

	end

	def test_to_integer

	end

	def test_to_matrix

	end

	def test_to_nmatrix

	end

	def test_to_yale

	end

	def test_to_lil

	end

	def test_to_dok

	end

end