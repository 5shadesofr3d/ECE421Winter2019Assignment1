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
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testInt16
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testInt32
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testInt64
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testFloat32
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testFloat64
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testComplex64
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end

	def testComplex128
		#test if the variable byte is held a true type
		matrix1 = NMatrix.new(3, 0, dtype: :int8)
		assert_equal((matrix1.dtype.is_a? :int8.class), true)
	end
end

# byte
# int8
# int16
# int32
# int64
# float32
# float64
# complex64
# complex128