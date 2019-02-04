require 'test/unit'
require 'nmatrix'
require_relative 'storage_module'
require_relative 'smatrix'

class Tests < Test::Unit::TestCase

  # TODO: Use SMatrix to construct different matrix types and test with it.
  # Matrices rely on factories which I don't know how they will be implemented.
  # Test properties of each type?
  # If I convert from a dense matrix to a sparse one, can I check
  # the sparsity to ensure it held up?
  # Can I confirm the theory of each storage type to ensure it works?
  # Also I need to generate random matrices.
  #
  # Nmatrix has its own tests for confirming Yale matrix functionality,
  # it tests the Yale implementation such as efficiency of storage
  # and resizing elements rather than mathematical components.

  # Test creation methods
  def test_create_dense

  end

  def test_create_yale

  end

  def test_create_list

  end

  # Test all conversion methods
  def test_cast_dense_to_yale

    # Initialize NMatrix
    matrixIn = SMatrix.new(3, 3, [1, 2, 3],
                                                       [4, 5, 6])

    # Pre-condition:
    # assert_equal(matrixIn, :dense)

    # Action:
    matrixOut = matrixIn.cast(:stype => :yale, :dtype => :int64, :default => false)
                        .stype, :yale

    # Post-condition:
    # assert_equal(matrixOut.stype, :yale)

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

end

puts "hello, world"
puts NMatrix::new([2, 2], [1, 2, 3, 4], :stype => :yale).stype