require 'nmatrix'
class NStorage < SparseStorage

  def initialize(rows, columns)
		# constructs a standard matrix

		# pre
		assert rows.is_a? Integer and columns.is_a? Integer
		assert rows >= 0 and columns >= 0
    super(rows, columns)
    @storage = NMatrix.new([rows,columns])
		# post
		@rows = rows
		@columns = columns

		assert valid?
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
    assert scalar.is_a? Numeric
    @storage = @storage*scalar
  end

  def divide(scalar)
    assert scalar != 0
    assert scalar.is_a? Numeric
    @storage = @storage/scalar
  end

  def exponent(scalar)
    assert scalar.is_a? Numeric
    result = @storage**scalar
    return result
  end

  def trace
    assert @storage.is_a? NMatrix
    assert @storage.shape[0] == @storage.shape[1]
    result = @storage.trace()
    return result
  end

  def rank
    assert @storage.is_a? NMatrix
    result = @storage.rank()
    return result
  end

  def det
    assert @storage.is_a? NMatrix
    result = NMatrix.det(@storage)
    return result
  end

  def invert
    assert @storage.is_a? NMatrix

    original_type = @storage.stype
    result = @storage.cast(:dense) # Convert to do inversion.
    return result.inverse.cast(original_type) # Invert and covert back before returning.

  end

  def complex_conjugate
    assert @storage.is_a? NMatrix
    result = NMatrix.complex_conjugate(@storage)
    return result
  end

protected
  @storage
end
