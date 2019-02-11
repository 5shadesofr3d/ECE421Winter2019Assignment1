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
		# NOTE: some of these "to_i" must be confirmed in another test
		@row = @col = (rand * @@maxsize).to_i
		@eye = STest.I(@row)
		@rand = STest.random(@row, @col).to_i
		@zero = STest.zero(@row, @col)
	end

	# Test the random builder first for it will be used multiple times after
	def test_random
		# Check that all of the values in the matrix are integers
		for i in 0..(@row-1) do
			for j in 0..(@col-1) do
				# check that the value is an integer which is valid
				# NOTE: will complex numbers be a factor in the future?
				assert(@rand[i, j].is_a? Integer) || assert(@rand[i, j].is_a? Numeric)
			end
		end
	end

	def test_I
		# This test will cover both the "I" and the "Eye" functions in the module

		#Create a normal matrix to use dot product on
		normalMatrix = STest.random(@row, @col)

		# The theory is that the dot product of I * A = A
		# If the dot product does indeed work then the identity matrix is true

		resultMatrix = normalMatrix.dot(@eye)
		assert_equal(resultMatrix, normalMatrix)
	end

	def test_zero
		# makes sure that the matrix is just full of zeros
		for i in 0..(@row-1) do
			for j in 0..(@col-1) do
				# check that the value is an integer which is valid
				# NOTE: will complex numbers be a factor in the future?
				assert_equal(@zero[i, j], 0)
			end
		end
	end

	def test_tridiagonal
		# checks that there are values only in the 3 main diagonal's of the matrix

        upperDia = Array.new(@row-1) { rand(1..@row) }
        middleDia = Array.new(@row) { rand(1..@row) }
        lowerDia = Array.new(@row-1) { rand(1..@row) }
        triMatrix = STest.tridiagonal(upperDia, middleDia, lowerDia)


        for i in 0..(@row-1) do
        	for j in 0..(@col-1) do
        		# check that the points of the tridiagonal are non-zeros
        		if i == j or (i-1) == j or (i+1) == j
        			assert_not_same(triMatrix[i, j], 0)
        		else
        			assert_equal(triMatrix[i, j], 0)
        		end
        	end
        end
	end

	def test_partition

	end

end