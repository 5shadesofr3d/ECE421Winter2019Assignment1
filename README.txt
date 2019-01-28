This is the README for the first assigment

We are going to start writing the test cases and the unit test cases for the
functionality of the entire program

The main focus on this assignment is creating classes and modules that will
have methods and objects that will handle normal matrix calculations and for
sparse matrix calculations

The unit test cases will be writtent as follows:
- We must use the "design by contract" approach. The following method is explained below
- We must also use the unit test case package explained in Lab 3

Coding practices:
THIS MAY CHANGE
- try to keep modules in seperate ruby files (e.g. "Module.rb")
- every class should be its own file (e.g. "Class1.rb")
- test cases for individual classes are their own file (e.g. "testClass1.rb")
- test cases will later be stored in a conglomorate test file (e.g. "alltests.rb")



-------- DESIGN BY CONTRACT ------------------
Design By Contract:
For all of the methods that are made, an invarient, pre, and post conditions are required
to explain what the method should do. This can be the "comment" for the method.

def method(x)
	#Write the preconditions
	pre
		x = something

	#The main functionality

	post
		x = something - something else
end

#write any of the common invariants that may come up before the function is called
Invariants
	x must be >= 0 or x must be a character

-------- DESIGN BY CONTRACT ------------------




-------- UNIT TESTING -------------------
Unit Test:
This is to ensure that the functionality of any methods that is created is justified

The following is the base for all unit test cases in ruby

#Start Test Case
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




The following are all of the possible ASSERTIONS to use:

assert_match( pattern, string, [message] ): True if string =~ pattern

assert_no_match( pattern, string, [message] ): Passes if regexp !~ string

assert_nil( object, [message] ): True if object == nil

assert_not_nil( object, [message] ): Passes if ! object .nil?

assert_in_delta( expected_float, actual_float, delta, [message] ): True if (actual_float - expected_float).abs <= delta

assert_instance_of( class, object, [message] ): True if object.class == class

assert_kind_of( class, object, [message] ): True if object.kind_of?(class)

assert_same( expected, actual, [message]): True if actual.equal?( expected ).

assert_not_same( expected, actual, [message] ): Passes if ! actual .equal? expected

assert_raise( Exception,... ) {block}: True if the block raises (or doesn't) one of the listed exceptions.

assert_nothing_raised( Exception,...) {block}: Passes if block does not raise an exception.

assert_throws( expected_symbol, [message] ) {block}: True if the block throws (or doesn't) the expected_symbol.

assert_nothing_thrown( [message] ) {block}: Passes if block does not raise an exception.

assert_respond_to( object, method, [message] ): True if the object can respond to the given method.

assert_send( send_array, [message] ): True if the method sent to the object with the given 

assert_operator( object1, operator, object2, [message] ): Compares the two objects with the given operator, passes if true

build_message(head, template=nil, *arguments)click to toggle source: Builds a failure message. head is added before the template and arguments replaces the ‘?’s positionally 
in the template.

flunk(message="Flunked"): Flunk always fails.

-------- UNIT TESTING -------------------