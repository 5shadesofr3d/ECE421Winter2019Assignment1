require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'matrix'

class TestArithmetic<Test::Unit::TestCase

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

    sMatrixQuotient = SMatrix.new(Yale.new(3, 3))

    value = 3

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixQuotient[i, j] = value / 3
        value += 3
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 / 3 #should be of type Yale
    sMatrix5 = sMatrix2 / 3 #should be of type DoK
    sMatrix6 = sMatrix3 / 3 #should be of type Lil

    assert(sMatrixQuotient.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixQuotient.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixQuotient.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
  end

  #TODO: Improve this
  def test_exponentiation

    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixExponent = SMatrix.new(Yale.new(3, 3))

    value = 1

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixExponent[i, j] = value ** 4
        value += 1
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 ** 4 #should be of type Yale
    sMatrix5 = sMatrix2 ** 4 #should be of type DoK
    sMatrix6 = sMatrix3 ** 4#should be of type Lil

    assert(sMatrixExponent.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixExponent.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixExponent.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
  end

  #TODO: Improve this
  def test_multiplication
    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixProduct = SMatrix.new(Yale.new(3, 3))

    value = 1

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        sMatrixProduct[i, j] = value * 3
        value += 1
      end
    end

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1 * 3 #should be of type Yale
    sMatrix5 = sMatrix2 * 3#should be of type DoK
    sMatrix6 = sMatrix3 * 3#should be of type Lil

    assert(sMatrixProduct.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixProduct.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixProduct.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
  end

  def test_dot
    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3), :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    sMatrixDot = SMatrix.new(Yale.new(3, 3))

    value = 1

    for i in 0..2 do
      for j in 0..2 do
        sMatrix1[i, j] = value
        sMatrix2[i, j] = value
        sMatrix3[i, j] = value

        value += 1
      end
    end

    sMatrixDot[0, 0] = 468
    sMatrixDot[0, 1] = 576
    sMatrixDot[0, 2] = 684
    sMatrixDot[1, 0] = 1062
    sMatrixDot[1, 1] = 1305
    sMatrixDot[1, 2] = 1548
    sMatrixDot[2, 0] = 1656
    sMatrixDot[2, 1] = 2034
    sMatrixDot[2, 2] = 2412

    #assert sMatrix3 == sMatrix1 * 2
    sMatrix4 = sMatrix1.dot(sMatrix2).dot(sMatrix3) #should be of type Yale
    sMatrix5 = sMatrix2.dot(sMatrix3).dot(sMatrix1)#should be of type DoK
    sMatrix6 = sMatrix3.dot(sMatrix1).dot(sMatrix2)#should be of type Lil

    assert(sMatrixDot.equals(sMatrix4)) #yale addition works
    assert(sMatrix4.type == Yale) #still a yale

    assert(sMatrixDot.equals(sMatrix5)) #Dok addition works
    assert(sMatrix5.type == Dok) #still a Dok

    assert(sMatrixDot.equals(sMatrix6)) #Lil addition works
    assert(sMatrix6.type == Lil) #still a Lil
  end

  def test_power
    #test the power functions from the SMatrixes
    #create the matrices required
    sMatrix1 = SMatrix.new(Yale.new(3, 3))
    sMatrix2 = SMatrix.new(Dok.new(3, 3) :dok)
    sMatrix3 = SMatrix.new(Lil.new(3, 3), :lil)

    eMatrix1 = SMatrix.new(Yale.new(3, 3))


    #fill in the 3 matrices with desired values
    #TODO: this will have to be randomly generated everytime


    ##ENTER CODE HERE


    #Do the operations
    rMatrix1 = sMatrix1.pow(2)
    rMatrix2 = sMatrix2.pow(2)
    rMatrix3 = sMatrix3.pow(2)

    # run the assertions

    ## ENTER THE CODE FOR ASSERTIONS

  end

end
