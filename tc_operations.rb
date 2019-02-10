require './SMatrix'
require 'test/unit'
require_relative 'storage/yale'
require_relative 'storage/dok'
require_relative 'storage/lil'
require 'matrix'

class TestOperations<Test::Unit::TestCase

  def test_addition

    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixSum = SMatrix.new(Yale.new(3, 3))

    value = 1

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixSum[i, j] = value * 3
        value += 1
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 + sMatrix2 + sMatrix3 # + sMatrix3 #should be of type Yale
    sMatrix5 = sMatrix2 + sMatrix3 + sMatrix1 #should be of type DoK
    sMatrix6 = sMatrix3 + sMatrix1 + sMatrix2 #should be of type Lil

    assert(sMatrixSum.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixSum.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixSum.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil

  end

  def test_subtraction
    #Init matrix1 as 3x3 matrix of all 0's
    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixDifference = SMatrix.new(Yale.new(3, 3))

    value = 1

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixDifference[i, j] = value * -1
        value += 1
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 - sMatrix2 - sMatrix3 #should be of type Yale
    sMatrix5 = sMatrix2 - sMatrix3 - sMatrix1 #should be of type DoK
    sMatrix6 = sMatrix3 - sMatrix1 - sMatrix2 #should be of type Lil

    assert(sMatrixDifference.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixDifference.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixDifference.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
  end

  #TODO:Improve this
  def test_division
    #Init matrix1 as 3x3 matrix of all 0's
    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixDifference = SMatrix.new(Yale.new(3, 3))

    value = 3

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixDifference[i, j] = value / 3
        value += 3
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 / 3 #should be of type Yale
    sMatrix5 = sMatrix2 / 3 #should be of type DoK
    sMatrix6 = sMatrix3 / 3 #should be of type Lil

    assert(sMatrixDifference.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixDifference.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixDifference.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
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
