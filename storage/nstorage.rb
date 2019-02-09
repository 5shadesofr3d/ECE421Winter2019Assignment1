require 'nmatrix'
require_relative 'sparse_storage'

class NStorage < SparseStorage

  def initialize(row_count, column_count)
		# constructs a standard matrix
    super(row_count, column_count)

		assert valid?
	end

  def valid?
    super and @storage.is_a? NMatrix
  end

  def [](i, j)
      # returns the matrix index at position i, j

      # pre
      assert i.is_a? Integer and j.is_a? Integer
      assert 0 <= i and i < @rows
      assert 0 <= j and j < @columns

      # post
      assert valid?
      @storage[i, j]
  end

  def []=(i, j, value)
      # assigning a value the matrix index at position i, j
      assert valid?

      # pre
      assert i.is_a? Integer and j.is_a? Integer
      assert 0 <= i and i < @rows
      assert 0 <= j and j < @columns
      assert value.is_a? Numeric

      #TODO: Implement

      # post
      assert valid?
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

  def clone
    instance = self.class.new(@rows, @columns)
    instance.storage = @storage.clone

    instance
  end

protected
  attr_accessor :storage
end
