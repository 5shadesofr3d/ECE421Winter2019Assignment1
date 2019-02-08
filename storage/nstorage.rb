require 'nmatrix'
require_relative 'sparse_storage'

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
    @storage**scalar
  end

  def power(pow)
    assert @storage.is_a? NMatrix
    @storage.pow(pow)
  end

  def dot(m1)
    assert @storage.is_a? NMatrix

    # NMatrix m1.dot(m2) requires that m1 and m2 are the same stype.
    @storage.dot(m1.cast(@storage.stype))
  end

  def trace
    assert @storage.is_a? NMatrix
    assert @storage.shape[0] == @storage.shape[1]
    @storage.trace
  end

  def rank
    assert @storage.is_a? NMatrix
    @storage.rank
  end

  def det
    assert @storage.is_a? NMatrix
    @storage.det
  end

  def invert
    assert @storage.is_a? NMatrix

    original_type = @storage.stype
    result = @storage.cast(:dense) # Convert to do inversion.
    result.inverse.cast(original_type) # Invert and convert back before returning.

  end

  def complex_conjugate
    assert @storage.is_a? NMatrix
    @storage.complex_conjugate
  end

  def lu_factorization
    assert @storage.is_a? NMatrix

    original_type = @storage.stype
    result = @storage.cast(:dense) # Convert to do factorization.

    result.factorize_lu.cast(original_type)
  end

  def cholesky_factorization
    assert @storage.is_a? NMatrix
    @storage.factorize_cholesky
  end

  def hermitian?
    assert @storage.is_a? NMatrix
    @storage.hermitian?
  end

protected
  @storage
end
