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

end
