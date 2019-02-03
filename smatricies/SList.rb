class SList < IMatrix
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    assert mat.list?
    super
  end

  def add(mat)
      #pre
      assert mat.list? and @matrix.list?

      super

      #post
      assert @matrix.list?
  end

  def subtract(mat)
      #pre
      assert mat.list? and @matrix.list?

      super

      #post
      assert @matrix.list?
  end

  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      super

      #post
      assert @matrix.list?
  end

  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      super

      #post
      assert @matrix.list?
  end

  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      super

      #post
      assert @matrix.list?
  end

  def dot(mat)
      #pre
      assert mat.list?

      super

      #post
      #@matrix = @matrix DOT mat
      assert mat.list?
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
