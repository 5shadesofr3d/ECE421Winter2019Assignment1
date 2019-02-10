module Triangle
	# TODO: Do these 2 functions violate dry?
	def upper_triangle(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		upper = []
		self.each_upper do |value|
			upper << value
		end

		assert valid?

		upper
	end

	def upper_triangle!(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.upper_triangle!(k)

		assert valid?
	end

	def lower_triangle(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# TODO: Not sure what the k means ...
		lower = []
		self.each_lower do |value|
			lower << value
		end

		assert valid?

		lower
	end

	def lower_triangle!(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.lower_triangle!(k)

		assert valid?
	end
end