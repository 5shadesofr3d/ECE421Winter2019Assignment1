require 'nmatrix'
require 'test/unit'

# SMatrix = Sparse Matrix
# do we really need it since we are only concerned about sparse matrices?
# Also name can be confused with sparse matrix... that was the point :p
class SMatrix
  include Test::Unit::Assertions

  def initialize(rows, columns, *matrix)
    # pre
    assert rows.is_a? Integer
    assert columns.is_a? Integer

    # post
    @rows = rows
    @columns = columns
    @matrix = NMatrix[matrix]
    for i in 0 .. (rows - 1)
      for j in 0 .. (columns - 1)
        puts "#{i}#{j}"
        assert_same(matrix[i][j], self[i, j])
      end
    end
  end

  # Real cast function can take a variable # of arguments.
  # cast(stype, dtype, default) → NMatrix
  # cast(stype, dtype) → NMatrix
  # cast(stype) → NMatrix
  # cast(options) → NMatrix
  def cast(*params)

    assert @matrix.stype == :yale ||
               @matrix.stype == :dense ||
               @matrix.stype == :list
    # Pre-conditions
    # if params.size > 0 && params[0].is_a?(Hash)
    #   opts = {
    #       :stype => @matrix.stype,
    #       :dtype => @matrix.dtype,
    #       :default => @matrix.stype == :dense ? 0 : @matrix.default_value
    #   }.merge(params[0])
    #
    #   @matrix.cast(opts[:stype], opts[:dtype], opts[:default])
    # else
    #   params << @matrix.stype if params.size == 0
    #   params << @matrix.dtype if params.size == 1
    #   default_value = maybe_get_noncomplex_default_value(params[1])
    #   params << (@matrix.stype == :dense ? 0 : default_value) if params.size == 2
    # end

    #Post conditions
    assert @matrix.stype == :yale ||
                   @matrix.stype == :dense ||
                   @matrix.stype == :list
    return @matrix.cast(*params)

  end

  def succ
    puts 'hi'
  end

  def [](i, j)
    # returns the matrix index at position i, j

    # pre
    assert i.is_a? Integer
    assert j.is_a? Integer
    assert 0 <= i && i < @rows
    assert 0 <= j && j < @columns

    # post
    return @matrix[i, j]
  end

  @rows
  @columns
  @matrix

end

# class IdentityMatrix < SMatrix

# 	def initialize(rows, columns)
# 		super(rows, columns)
# 		assert @matrix.identity?
# 	end

# end

s = SMatrix.new(3, 3,
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9]
)
s.cast(:stype => :list, :dtype => :int64, :default => false)
puts s[0, 0]
puts "gello"