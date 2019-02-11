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
    #assert(dokMatrix.trace == randomSum)
    assert(lilMatrix.trace == randomSum)

  end

  

end
