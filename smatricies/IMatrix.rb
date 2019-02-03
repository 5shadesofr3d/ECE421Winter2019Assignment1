## This is the master class of all NMatrix sparse Matrix
##storage types. All subclasses MUST use NMatrix ruby gem implementation
#of sparse matricies

##This class should not be instantiated directly
##Use subclasses
class IMatrix
  def initialize(mat)
    ##Pass in a matrix built by abstract factory
    @matrix = mat
  end

  #Generic add for all NMatrix types
  def add(mat)
      #pre
      assert mat.is_a? NMatrix
      assert mat.shape == @matrix.shape

      #TODO: Main functionality
      result = @matrix + mat
      @matrix = @matrix + mat

      #post
      assert @matrix.shape == mat.shape
      assert result == @matrix
  end

  #Generic sub for all NMatrix types
  def subtract(mat)
      #pre
      assert mat.is_a? NMatrix
      assert mat.shape == @matrix.shape

      #TODO: Main functionality
      result = @matrix - mat
      @matrix = @matrix - mat

      #post
      assert @matrix.shape == mat.shape
      assert result == @matrix
  end

  #Generic divide for all NMatrix types
  def divide(scalar)
      #pre
      assert scalar.is_a? Integer
      assert scalar != 0

      #TODO: Main functionality
      result = @matrix/scalar
      @matrix = @matrix/scalar

      #post
      assert result == @matrix
  end

  #Generic exponent for all NMatrix types
  def exponent(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
      result = @matrix**scalar
      @matrix = @matrix**scalar

      #post
      assert result == @matrix
  end

  #Generic multiply for all NMatrix types
  def multiply(scalar)
      #pre
      assert scalar.is_a? Integer

      #TODO: Main functionality
      result = @matrix*scalar
      @matrix = @matrix*scalar

      #post
      assert result == @matrix
  end

  def dot(mat)
      #pre
      assert mat.is_a? NMatrix

      @matrix.dot(mat)

      #post
      #@matrix = @matrix DOT mat
      assert mat.is_a? NMatrix
  end

  def trace()
      #pre
      #Matrix MUST be square to trace
			assert @matrix.rows == @matrix.cols

      @matrix.trace
	end

  def rank()
			#TODO: Implement
      #No real assertions here..?
	end

  def row_sum(rowNum)
			assert rowNum.is_a? Integer
			assert rowNum >= 0
      assert rowNum < @matrix.rows
			#TODO: Implement
	end

	def col_sum(colNum)
			assert colNum.is_a? Integer
			assert colNum >= 0
      assert colNum < @matrix.cols
			#TODO: Implement
	end

	def total_sum()
			#TODO: Implement
	end
end
