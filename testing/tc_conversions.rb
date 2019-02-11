require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'matrix'

STest = SMatrix

class TestConversions<Test::Unit::TestCase
	# this is to test all of the functions in the builder module for smatrix
	@@maxsize = 60

	def setup
		# start setting up the variables for the test cases
		# NOTE: some of these "to_i" must be confirmed in another test
		@row = @col = (rand * @@maxsize).to_i
		@sample = STest.random(@row, @col)
	end

	def test_to_string
		# ensure that the output is string type
		stringResult = @sample.to_s
		assert(stringResult.is_a? String)
	end

	def test_to_arrays
		#ensure that the values in the arrays match up with the original matrix

		# NOTE: this will also check the "each_row" functionality in SMatrix


		# get the arrays
		resultArray = @sample.to_a

		#Make the assertions
		# Check that all of the first row elements are the same as the first array
		for i in 0..(@row-1) do
			for j in 0..(@col-1) do
				# assert the the element values are the same
				assert_equal(@sample[i, j], resultArray[i][j])
			end
		end
	end

	def test_to_float
		# ensure that all of the values in the array are floating point integers

		# get the converted array
		resultMatrix = @sample.to_f

		for i in 0..(@row-1) do
			for j in 0..(@col-1) do
				# assert the the element values are the same
				assert(resultMatrix[i, j].is_a? Float)
			end
		end
	end

	def test_to_integer
		# ensure that all of the values in the array are integers

		# get the converted array
		resultMatrix = @sample.to_i

		for i in 0..(@row-1) do
			for j in 0..(@col-1) do
				# assert the the element values are the same
				assert(resultMatrix[i, j].is_a? Integer)
			end
		end

	end

	def test_to_matrix
		# Ensure that the SMatrix is converted to a ruby matrix

		# Get the converted array
		resultMatrix = @sample.to_matrix

		assert(resultMatrix.is_a? Matrix)
	end

	def test_to_nmatrix
		#Ensure that the SMatrix is converted to a ruby matrix

		#Get the converted array
		resultMatrix = @sample.to_nmatrix

		assert(resultMatrix.is_a? NMatrix)
	end

	def test_to_yale
		#Ensure that the converted SMatrix is of type yale

		#Get the converted yale matrix
		yaleMatrix = @sample.to_yale

		assert(yaleMatrix.type == Yale)
	end

	def test_to_lil
		#Ensure that the converted SMatrix is of type Lil

		#Get the converted Lil matrix
		lilMatrix = @sample.to_lil

		assert(lilMatrix.type == Lil)
	end

	def test_to_dok
		#Ensure that the converted SMatrix is of type Dok

		#Get the converted Dok matrix
		dokMatrix = @sample.to_dok

		assert(dokMatrix.type == Dok)
	end

end