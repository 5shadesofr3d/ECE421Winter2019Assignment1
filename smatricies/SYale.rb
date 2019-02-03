class SYale < IMatrix
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
end
