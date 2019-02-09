require 'nmatrix'
require_relative 'sparse_storage'
class NStorage < SparseStorage

  def initialize(rows, columns)
		# constructs a standard matrix, initializing all elements to 0
    super(rows, columns)
    @storage = NMatrix.new([rows,columns])

    self.set_all_values(0)

	end

  def get_matrix
		return @storage
	end

	def set_matrix(mat)
    raise ArgumentError.new("Matrix must be of type NMatrix") if !mat.is_a? NMatrix
		@storage = mat
	end

	def [](i, j)
    return @storage[i, j]
	end

	def []=(i, j, value)
		@storage[i, j] = value
	end

  def add(m1)
    if m1.is_a? Dok
      #TODO: CONVERT and go
    end
    @storage = @storage+m1
  end

  def subtract(m1)
    if m1.is_a? Dok
      #TODO: CONVERT and go
    end
    @storage = @storage-m1
  end

  def multiply(scalar)
    raise ArgumentError.new("Type must be a number") if !value.is_a? Numeric
    @storage = @storage*scalar
  end

  def divide(scalar)
    raise ArgumentError.new("Scalar must not be 0") if value == 0
    raise ArgumentError.new("Type must be a number") if !value.is_a? Numeric
    @storage = @storage/scalar
  end

  def exponent(scalar)
    raise ArgumentError.new("Type must be a number") if !value.is_a? Numeric
    result = @storage**scalar
    return result
  end

  def square?
    return @storage.shape[0] == @storage.shape[1]

  def trace
    raise TypeError.new("Matrix must be a square in order to perform the trace function") if !self.square?
    return @storage.trace()
  end

  def rank
    result = @storage.rank()
    return result
  end

  def det
    result = NMatrix.det(@storage)
    return result
  end

  def invert

    original_type = @storage.stype
    result = @storage.cast(:dense) # Convert to do inversion.
    return result.inverse.cast(original_type) # Invert and covert back before returning.

  end

  def complex_conjugate
    result = NMatrix.complex_conjugate(@storage)
    return result
  end

  def set_all_values(value)
    # Fills and replaces all elements in the matrix with a given value

    raise ArgumentError.new("Type must be a number") if !value.is_a? Numeric

    for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				self[i, j] = value
			end
		end

  end
end

protected
  @storage
end
