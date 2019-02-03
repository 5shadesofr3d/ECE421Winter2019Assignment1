#This will be checking the data types related to the matrices
require 'test/unit'
require 'nmatrix'

class TestData < Test::Unit::TestCase

	def testBYTE
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :byte)
		assert_equal((matrix1.dtype.is_a? :byte.class), true)

	end
	def testInt8
		#test if the variable int is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testInt16
		#test if the variable int is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testInt32
		#test if the variable int is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int32)
		assert_equal((matrix1.dtype.is_a? :int32.class), true)
	end

	def testInt64
		#test if the variable int is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int64)
		assert_equal((matrix1.dtype.is_a? :int64.class), true)
	end

	def testFloat32
		#test if the floating type is valid for matrix creation
		matrix1 = NMatrix.new(3, 0, dtype: :float32)
		assert_equal((matrix1.dtype.is_a? :float32.class), true)
	end

	def testFloat64
		#test if the floating type is valid for matrix creation
		matrix1 = NMatrix.new(3, 0, dtype: :float64)
		assert_equal((matrix1.dtype.is_a? :float64.class), true)
	end

	def testComplex64
		#test if the complex type is held true for the matrix
		matrix1 = NMatrix.new(3, 0, dtype: :complex64)
		assert_equal((matrix1.dtype.is_a? :complex64.class), true)
	end

	def testComplex128
		#test if the complex type is held true for the matrix
		matrix1 = NMatrix.new(3, 0, dtype: :complex128)
		assert_equal((matrix1.dtype.is_a? :complex128.class), true)
	end

	def testRubyObject
		#check if the values being held are of the type object when created
		matrix1 = NMatrix.new(3, 0, dtype: :object)
		assert_equal((matrix1.dtype.is_a? :object.class), true)
	end

	def testRational32
		#NOTE: this may be removed in future updates
		matrix1 = NMatrix.new(3, 0, dtype: :rational32)
		assert_equal((matrix1.dtype.is_a? :rational32.class), true)
	end

	def testRational64
		#NOTE: this may be removed in future updates
		matrix1 = NMatrix.new(3, 0, dtype: :rational64)
		assert_equal((matrix1.dtype.is_a? :rational64.class), true)
	end

	def testRational128
		#Check if the values in the matrix are rational type
		matrix1 = NMatrix.new(3, 0, dtype: :rational128)
		assert_equal((matrix1.dtype.is_a? :rational128.class), true)
	end
end