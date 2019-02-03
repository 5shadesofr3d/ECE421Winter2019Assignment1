class SList < IMatrix
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    super
  end

  def add(mat)
      #pre
      assert mat.list? and @matrix.list?

      #TODO: Main functionality
      super

      #post
      assert @matrix.list?
  end

  def subtract(mat)
      #pre
      assert mat.list? and @matrix.list?

      #TODO: Main functionality
      super

      #post
      assert @matrix.list?
  end

  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      #TODO: Main functionality
      super

      #post
      assert @matrix.list?
  end

  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
      super

      #post
      assert @matrix.list?
  end

  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
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
end
