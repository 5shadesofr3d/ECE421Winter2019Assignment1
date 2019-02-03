require 'test/unit'
require 'nmatrix'
require_relative 'storage_module'

class Tests < Test::Unit::TestCase

  def test_cast_dense_to_yale
    assert_equal(NMatrix[[1.0, 2.0], [3.0, 4.0]]
                  .cast(:stype => :yale, :dtype => :int64, :default => false)
                  .stype, :yale)

  end

end

puts "hello, world"
puts NMatrix[1.0, 2.0].stype == :dense