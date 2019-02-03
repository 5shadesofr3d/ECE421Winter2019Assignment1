require './Matrix.rb'
require 'test/unit'
require 'nmatrix'

class TestOperations<Test::Unit::TestCase
  def test_addition

    #Init matrix1 as 3x3 matrix of all 0's
    matrix1 = Matrix.new(3)

    #Init matrix2 as 3x3 matrix of all
    matrix2 = NMatrix.new(3, [1,2,3,4,5,6,7,8,9])

    ##Pre conditions
    assert_equal(matrix1.shape, matrix2.shape) ##Ensure they are same size

    #perform operation
    matrix1.add(matrix2)

    ##Post conditions
    assert_equal(NMatrix.new(3,[1,2,3,4,5,6,7,8,9]),matrix1)
    assert_equal(matrix2.shape, matrix1.shape)

  end

  def test_subtraction
    #Init matrix1 as 3x3 matrix of all 0's
    matrix1 = Matrix.new(3)

    #Init matrix2 as 3x3 matrix of all
    matrix2 = NMatrix.new(3, [1,2,3,4,5,6,7,8,9])

    ##Pre conditions
    assert_equal(matrix1.shape, matrix2.shape) ##Ensure they are same size

    #perform operation
    matrix1.subtract(matrix2)

    ##Post conditions
    assert_equal(NMatrix.new(3,[-1,-2,-3,-4,-5,-6,-7,-8,-9]),matrix1)
    assert_equal(matrix2.shape, matrix1.shape)
  end

  #TODO:Improve this
  def test_division
    #Init matrix1 as 3x3 matrix of all 0's
    matrix1 = Matrix.new(3)

    #Init matrix2 as 3x3 matrix of all
    ##Pre conditions

    #perform operation
    scalar = 2
    matrix1.divide(scalar)

    ##Post conditions
    assert_equal(NMatrix.new(3),matrix1)
  end

  #TODO: Improve this
  def test_exponentiation
    #Init matrix1 as 3x3 matrix of all 0's
    matrix1 = Matrix.new(3)

    #Init matrix2 as 3x3 matrix of all
    ##Pre conditions

    #perform operation
    scalar = 2
    matrix1.exponent(scalar)

    ##Post conditions
    assert_equal(NMatrix.new(3),matrix1)
  end

  #TODO: Improve this
  def test_multiplication
    #Init matrix1 as 3x3 matrix of all 0's
    matrix1 = Matrix.new(3)

    #Init matrix2 as 3x3 matrix of all
    ##Pre conditions

    #perform operation
    scalar = 2
    matrix1.multiply(scalar)

    ##Post conditions
    assert_equal(NMatrix.new(3),matrix1)
  end
end
