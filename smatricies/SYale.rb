class SYale < IMatrix
  # --- Class Invariants ---
	# @matrix is of type NMatrix
  # @matrix is of storage type Yale
  # @matrix has columns >= 0
  # @matrix has rows >= 0
	# ------------------
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    assert mat.yale?
    super
  end

  def add(mat)
      #pre
      assert mat.yale? and @matrix.yale?

      super

      #post
      assert @matrix.yale?
  end

  def subtract(mat)
      #pre
      assert mat.yale? and @matrix.yale?

      super

      #post
      assert @matrix.yale?
  end

  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      super

  end

  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      super

  end

  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      super

  end

  def dot(mat)
      #pre
      assert mat.yale?

      super

      #post
      assert mat.yale?
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

  def diagonal()
  		super
	end
end
