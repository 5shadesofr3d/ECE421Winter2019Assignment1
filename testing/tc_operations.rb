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

    assert(yaleMatrix.rank == 2)
    assert(dokMatrix.rank == 1)
    assert(lilMatrix.rank == 0)

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

  def test_lu
    a = SMatrix.new(Matrix[
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ])

    l, u, perm = a.lu_factorization
    assert_equal(perm % a, (l % u)) 
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
