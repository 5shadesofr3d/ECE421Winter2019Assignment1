require 'nmatrix'
module NMatrixBasicOperations
  def add(m1,m2)
    assert m1.is_a? NMatrix and m2.is_a? NMatrix
    result = m1+m2
    return result
  end

  def subtract(m1,m2)
    assert m1.is_a? NMatrix and m2.is_a? NMatrix
    result = m1-m2
    return result
  end

  def multiply(m1, scalar)
    assert m1.is_a? NMatrix and scalar.is_a? Numeric
    result = m1*scalar
    return result
  end

  def divide(m1, scalar)
    assert scalar != 0
    assert m1.is_a? NMatrix and scalar.is_a? Numeric
    result = m1/scalar
    return result
  end

  def exponent(m1, scalar)
    assert m1.is_a? NMatrix and scalar.is_a? Numeric
    result = m1**scalar
    return result
  end

  def trace(m1)
    assert m1.is_a? NMatrix
    result = m1.trace()
    return result
  end

  def rank(m1)
    assert m1.is_a? NMatrix
    result = m1.rank()
    return result
  end
end
