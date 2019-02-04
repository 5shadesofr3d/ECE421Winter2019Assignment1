class SList < IMatrix
  # --- Class Invariants ---
	# @matrix is of type NMatrix
  # @matrix is of storage type List
  # @matrix has columns >= 0
  # @matrix has rows >= 0
	# ------------------
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    assert mat.list?
    super
  end

  def add(mat)
      #pre
      assert mat.list?

      super

      #post
      #@matrix = @matrix+mat
      assert @matrix.list?
  end

  def subtract(mat)
      #pre
      assert mat.list?

      super

      #post
      #@matrix = @matrix-mat
      assert @matrix.list?
  end

  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      super

      #post
      #@matrix = @matrix/scalar (element wise)
      assert @matrix.list?
  end

  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      super

      #post
      #@matrix = @matrix^scalar (Element wise exponent)
      assert @matrix.list?
  end

  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      super

      #post
      #@matrix = @matrix*scalar
      assert @matrix.list?
  end

  def dot(mat)
      #pre
      assert mat.list?

      super

      #post
      #@matrix = @matrix DOT mat
      assert @matrix.list?
  end

  def trace()
			super
	end

  def rank()
			super
	end

  def row_sum(rowNum)
			assert rowNum.is_a? Integer
			assert rowNum >= 0
      assert rowNum < @matrix.rows
			super
	end

	def col_sum(colNum)
			assert colNum.is_a? Integer
			assert colNum >= 0
      assert colNum < @matrix.cols
			super
	end

	def total_sum()
			super
	end

  def transpose()
			super
	end

  #Raise matrix to a power
	def power(pow)
      assert pow.is_a? Integer
			super
	end

  def inverse()
      assert @matrix.shape[0] == @matrix.shape[1] #square
			super
	end
end
