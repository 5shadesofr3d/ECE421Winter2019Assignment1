class SYale < IMatrix
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    super
  end

  def add(mat)
      #pre
      assert mat.yale? and @matrix.yale?

      #TODO: Main functionality
      super

      #post
      assert @matrix.yale?
  end

  def subtract(mat)
      #pre
      assert mat.yale? and @matrix.yale?

      #TODO: Main functionality
      super

      #post
      assert @matrix.yale?
  end

  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      #TODO: Main functionality
      super

      #post
      assert result == @matrix
  end

  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
      super

      #post
      assert result == @matrix
  end

  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
      super

      #post
      assert result == @matrix
  end
end
