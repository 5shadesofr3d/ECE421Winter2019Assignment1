require 'test/unit'
require 'nmatrix'
require_relative 'storage_module'

class Tests < Test::Unit::TestCase

  # Test all conversion methods
  def test_cast_dense_to_yale
    assert_equal(NMatrix[[1.0, 2.0], [3.0, 4.0]]
                  .cast(:stype => :yale, :dtype => :int64, :default => false)
                  .stype, :yale)

  end

  def test_cast_dense_to_list
    assert_equal(NMatrix[[1.0, 2.0], [3.0, 4.0]]
                     .cast(:stype => :yale, :dtype => :int64, :default => false)
                     .stype, :yale)

  end

  def test_cast_yale_to_dense
    assert_equal(NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :yale)
                     .cast(:stype => :dense, :dtype => :int64, :default => false)
                     .stype, :dense)

  end

  def test_cast_yale_to_list
    assert_equal(NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :yale)
                     .cast(:stype => :list, :dtype => :int64, :default => false)
                     .stype, :list)
  end

  def test_cast_list_to_dense
    assert_equal(NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :list)
                     .cast(:stype => :dense, :dtype => :int64, :default => false)
                     .stype, :dense)
  end

  def test_cast_list_to_yale
    assert_equal(NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :list)
                     .cast(:stype => :yale, :dtype => :int64, :default => false)
                     .stype, :yale)
  end

  # Test properties of each type?
  # If I convert from a dense matrix to a sparse one, can I check
  # the sparsity to ensure it held up?
  # Can I confirm the theory of each storage type to ensure it works?
  # Also I need to generate random matrices.

end

puts "hello, world"
puts NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :yale).stype