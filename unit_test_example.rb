## Copy this file for making unit test cases

require 'test/unit'

class TestCase < Test::Unit::TestCase
	
	def setup
		#setup attributes of the objects or any parameters that may be rused
		@example = 1
	end

	def teardown
		#this is for any deconstruction of objects
	end

	def testMethod
		#add the assertions
	end

	def testMethod2
		#add asserstions
	end
end
