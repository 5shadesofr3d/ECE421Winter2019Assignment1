class SMatrix


  def initialize(mSize)
    ##Create square matrix of size mSize
    ##Init full of zeros
    #TODO: Factory here to build the matrix
    @_matrix = NMatrix(mSize, 0)
  end

  def add(mat)
    #pre
    # mat = sparse yale format matrix
    # mat and _matrix must be matricies of the same size

    #TODO: Main functionality

    @_matrix = @_matrix + mat

    #post
    # result = m1 + m2
    # result has same dimensions as m1 and m2
  end

  def subtract(mat)
    #pre
    # mat = sparse yale format matrix
    # mat and _matrix must be matricies of the same size

    #TODO: Main functionality

    @_matrix = @_matrix - mat


    #post
    # result = m1 - m2
  end

  def divide(scalar)
    #pre
    # scalar = whole number integer to divide by

    #TODO: Main functionality

    @_matrix = @_matrix/scalar

    #post
    # result = m1 / m2
  end

  def exponent(scalar)
    #pre
    # scalar = whole number integer to exponentiate by

    #TODO: Main functionality

    @_matrix = @_matrix**scalar


    #post
    # result = m1 ^ m2
  end

  def multiply(scalar)
    #pre
    # scalar = whole number integer to multiply by

    #TODO: Main functionality
    @_matrix = @_matrix*scalar



    #post
    # result = m1 * m2
  end
end
