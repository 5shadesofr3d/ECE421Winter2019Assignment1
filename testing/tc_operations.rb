require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'matrix'

class TestOperations<Test::Unit::TestCase

  def test_trace
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    randomSum = 0

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)
        if i == j
          randomSum += value
        end
        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value
      end
    end

    assert(yaleMatrix.trace == randomSum)
    assert(dokMatrix.trace == randomSum)
    assert(lilMatrix.trace == randomSum)

  end

  def test_rank
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)
        if i == j
          yaleMatrix[i, j] = value
          dokMatrix[i, j] = value
          lilMatrix[i, j] = value
        else
          yaleMatrix[i, j] = 0
          dokMatrix[i, j] = 0
          lilMatrix[i, j] = 0
        end
      end
    end

    dokMatrix[1, 1] = 0
    lilMatrix[1, 1] = 0
    lilMatrix[2, 2] = 0

    #assert(yaleMatrix.rank == 3)
    #assert(dokMatrix.rank == 2)
    #assert(lilMatrix.rank == 1)

  end

  def test_rowsum
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    randomSum = 0
    randomRow = rand(3)

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)

        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value

        if i == randomRow
          randomSum += value
        end
      end
    end

    assert(yaleMatrix.row_sum(randomRow) == randomSum)
    assert(dokMatrix.row_sum(randomRow) == randomSum)
    assert(lilMatrix.row_sum(randomRow) == randomSum)

  end

  def test_colsum
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    randomSum = 0
    randomCol = rand(3)

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)

        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value

        if j == randomCol
          randomSum += value
        end
      end
    end

    assert(yaleMatrix.col_sum(randomCol) == randomSum)
    assert(dokMatrix.col_sum(randomCol) == randomSum)
    assert(lilMatrix.col_sum(randomCol) == randomSum)

  end

  def test_totalsum
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    randomSum = 0

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)

        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value

        randomSum += value
      end
    end

    assert(yaleMatrix.total_sum == randomSum)
    assert(dokMatrix.total_sum == randomSum)
    assert(lilMatrix.total_sum == randomSum)

  end

  def test_transpose
    yaleMatrix= SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

    for i in 0..2 do
      for j in 0..2 do
        value = rand(10)

        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value

      end
    end

    yaleTranspose = yaleMatrix.transpose
    dokTranspose = dokMatrix.transpose
    lilTranspose = lilMatrix.transpose

    for i in 0..2 do
      for j in 0..2 do
        assert(yaleMatrix[i, j] == yaleTranspose[j, i])
        assert(dokMatrix[i, j] == dokTranspose[j, i])
        assert(lilMatrix[i, j] == lilTranspose[j, i])
      end
    end

  end

  def test_determinant
    yaleMatrix= SMatrix.new(Yale.new(2, 2))
    dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
    lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)

    for i in 0..1 do
      for j in 0..1 do
        value = rand(10)

        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value

      end
    end

    det = (yaleMatrix[0, 0] * yaleMatrix[1, 1]) - (yaleMatrix[0, 1] * yaleMatrix[1, 0])

    yaleInverse = yaleMatrix.determinant
    dokInverse = dokMatrix.determinant
    lilInverse = lilMatrix.determinant
  end

  def test_cholesky
    yaleMatrix = SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)
    resultMatrixOne = SMatrix.new(Yale.new(3, 3))
    resultMatrixTwo = SMatrix.new(Yale.new(3, 3))

    yaleMatrix[0, 0] = 4
    dokMatrix[0, 0] = 4
    lilMatrix[0, 0] = 4
    resultMatrixOne[0, 0] = 2
    resultMatrixTwo[0, 0] = 2

    yaleMatrix[0, 1] = 12
    dokMatrix[0, 1] = 12
    lilMatrix[0, 1] = 12
    resultMatrixOne[0, 0] = 0
    resultMatrixTwo[0, 0] = 6

    yaleMatrix[0, 2] = -16
    dokMatrix[0, 2] = -16
    lilMatrix[0, 2] = -16
    resultMatrixOne[0, 0] = 0
    resultMatrixTwo[0, 0] = -8

    yaleMatrix[1, 0] = 12
    dokMatrix[1, 0] = 12
    lilMatrix[1, 0] = 12
    resultMatrixOne[0, 0] = 6
    resultMatrixTwo[0, 0] = 0

    yaleMatrix[1, 1] = 37
    dokMatrix[1, 1] = 37
    lilMatrix[1, 1] = 37
    resultMatrixOne[0, 0] = 1
    resultMatrixTwo[0, 0] = 1

    yaleMatrix[1, 2] = -43
    dokMatrix[1, 2] = -43
    lilMatrix[1, 2] = -43
    resultMatrixOne[0, 0] = 0
    resultMatrixTwo[0, 0] = 5

    yaleMatrix[2, 0] = -16
    dokMatrix[2, 0] = -16
    lilMatrix[2, 0] = -16
    resultMatrixOne[0, 0] = -8
    resultMatrixTwo[0, 0] = 0

    yaleMatrix[2, 1] = -43
    dokMatrix[2, 1] = -43
    lilMatrix[2, 1] = -43
    resultMatrixOne[0, 0] = 5
    resultMatrixTwo[0, 0] = 0

    yaleMatrix[2, 2] = 98
    dokMatrix[2, 2] = 98
    lilMatrix[2, 2] = 98
    resultMatrixOne[0, 0] = 3
    resultMatrixTwo[0, 0] = 3

    assert(resultMatrixOne.equals(yaleMatrix.cholesky[0]))
    assert(resultMatrixTwo.equals(yaleMatrix.cholesky[1]))
    assert(resultMatrixOne.equals(dokMatrix.cholesky[0]))
    assert(resultMatrixTwo.equals(dokMatrix.cholesky[1]))
    assert(resultMatrixOne.equals(lilMatrix.cholesky[0]))
    assert(resultMatrixTwo.equals(lilMatrix.cholesky[1]))

  end

  def test_lu
    yaleMatrix = SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)
    resultMatrixOne = SMatrix.new(Yale.new(3, 3))
    resultMatrixTwo = SMatrix.new(Yale.new(3, 3))

    yaleMatrix[0, 0] = 1
    dokMatrix[0, 0] = 1
    lilMatrix[0, 0] = 1
    resultMatrixOne[0, 0] = 1
    resultMatrixTwo[0, 0] = 1

    yaleMatrix[0, 1] = 2
    dokMatrix[0, 1] = 2
    lilMatrix[0, 1] = 2
    resultMatrixOne[0, 1] = 0
    resultMatrixTwo[0, 1] = 2

    yaleMatrix[0, 2] = 4
    dokMatrix[0, 2] = 4
    lilMatrix[0, 2] = 4
    resultMatrixOne[0, 2] = 2
    resultMatrixTwo[0, 2] = 4

    yaleMatrix[1, 0] = 3
    dokMatrix[1, 0] = 3
    lilMatrix[1, 0] = 3
    resultMatrixOne[1, 0] = 3
    resultMatrixTwo[1, 0] = 0

    yaleMatrix[1, 1] = 8
    dokMatrix[1, 1] = 8
    lilMatrix[1, 1] = 8
    resultMatrixOne[1, 1] = 1
    resultMatrixTwo[1, 1] = 2

    yaleMatrix[1, 2] = 14
    dokMatrix[1, 2] = 14
    lilMatrix[1, 2] = 14
    resultMatrixOne[1, 2] = 0
    resultMatrixTwo[1, 2] = 2

    yaleMatrix[2, 0] = 2
    dokMatrix[2, 0] = 2
    lilMatrix[2, 0] = 2
    resultMatrixOne[2, 0] = 2
    resultMatrixTwo[2, 0] = 0

    yaleMatrix[2, 1] = 6
    dokMatrix[2, 1] = 6
    lilMatrix[2, 1] = 6
    resultMatrixOne[2, 1] = 1
    resultMatrixTwo[2, 1] = 0

    yaleMatrix[2, 2] = 13
    dokMatrix[2, 2] = 13
    lilMatrix[2, 2] = 13
    resultMatrixOne[2, 2] = 1
    resultMatrixTwo[2, 2] = 3

    assert(yaleMatrix.lu_factorization[0].equals(resultMatrixOne))
    assert(yaleMatrix.lu_factorization[1].equals(resultMatrixTwo))
    assert(dokMatrix.lu_factorization[0].equals(resultMatrixOne))
    assert(dokMatrix.lu_factorization[1].equals(resultMatrixTwo))
    assert(lilMatrix.lu_factorization[0].equals(resultMatrixOne))
    assert(lileMatrix.lu_factorization[1].equals(resultMatrixTwo))


  end

  def test_conjugate

  end

  def test_partition
    yaleMatrix = SMatrix.new(Yale.new(3, 3))
    dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
    lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)
    resultMatrix = SMatrix.new(Yale.new(2, 2))

    value = rand(10)
    for i in 0..2 do
      for j in 0..2 do
        yaleMatrix[i, j] = value
        dokMatrix[i, j] = value
        lilMatrix[i, j] = value
        if i != 2 and j != 2
          resultMatrix[i, j] = value
        end
      end
    end

    assert(yaleMatrix.partition([0, 1], [0, 1]).equals(resultMatrix))
    assert(dokMatrix.partition([0, 1], [0, 1]).equals(resultMatrix))
    assert(lilMatrix.partition([0, 1], [0, 1]).equals(resultMatrix))

  end

end
