## This is the master class of all NMatrix sparse Matrix
##storage types. All subclasses MUST use NMatrix ruby gem implementation
#of sparse matricies

##This class should not be instantiated directly
##Use subclasses
class IMatrix
  # --- Class Invariants ---
	# @matrix is of type NMatrix
  # @matrix is of storage type Yale or List
  # @matrix has columns >= 0
  # @matrix has rows >= 0
	# ------------------
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

  def transpose()
      #pre
      #matrix to be transposed has been initialized
			@matrix = @matrix.transpose()
      #post
      #@matrix = @matrix transposed
	end

  #Raise matrix to a power
	def power(pow)
      assert pow.is_a? Integer
      assert @matrix.shape[0] == @matrix.shape[1] ##square matrix
			@matrix.pow(pow)
	end

  def inverse()
      #pre
      assert @matrix.shape[0] == @matrix.shape[1] #square only

      #TODO:
      #NMatrix only implements this for dense matricies
      #so we must convert types then calculate then convert back..
      #inefficient but necessary for now

      #post
      # @matrix = @matrix^-1
	end

  def diagonal()
			#pre

      @matrix.diagonal()

      #post
	end

  def determinant()
      #pre
      assert @matrix.shape[0] == @matrix.shape[1] #square
			@matrix.det()
      #post
	end

  def cholesky()
      assert @matrix.symmetric? #Matrix MUST be symmetric
      #TODO: Implement NMatrix cholesky factorization
	end

  def luDecomp
			#pre

      #TODO: Implement this, this has only been implemented for Dense
      #matricies in NMatrix so conversions MUST be done

      #post
	end

  def symmetric?
			@matrix.symmetric?
	end
end
