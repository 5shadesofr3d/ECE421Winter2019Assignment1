require './SMatrix'
require 'test/unit'

S = SMatrix

class TestOperations<Test::Unit::TestCase
    # THESE ARE RANDOM TEST CASES BASED OFF THE DOCUMENT FROM CLASS
    @@max_size = 10

    def setup
        @row = @col = (rand * @@max_size).to_i
        @a = S.random(@row, @col).to_i
        @b = S.random(@row, @col).to_i
        @c = S.random(@row, @col).to_i
        @d = S.random(@row, @col).to_i
        @z = S.zero(@row, @col)
        @i = S.I(@col)
    end
    
    def test_addition1
        assert_equal(@a+@b, @b+@a)
    end

    def test_addition2
        assert_equal(@a+@z, @a)
    end

    def test_addition3
        assert_equal((@a+@b)+@c, @a+(@b+@c))
    end

    def test_addition4
        assert_equal(-(@a+@b), -@a + -@b)
    end

    def test_subtraction1
        assert_equal(@a-@b, -(@b-@a))
    end

    def test_subtraction2
        assert_equal(@a-@a, @z)
    end

    def test_subtraction3
        assert_equal(@a-@b, @a + -@b)
    end

    def test_subtraction4
        assert_equal(-@z, @z)
    end

    def test_subtraction5
        assert_equal(-(-@a), @a)
    end

    def test_multiply1
        # assert_equal(a % ~b, a % (~b))
        assert_equal(@a % @i, @a)
        # assert_equal(a % ~a, i)
        # assert_equal(~~a, a)
    end

    def test_multiply2
        assert_equal(@i % @a, @a)
    end

    def test_multiply3
        assert_equal(~@i, @i)
    end

    def test_multiply4
        assert_equal(@a % (@b % @c), (@a % @b) % @c)
    end

    def test_multiply5
        assert_equal(@a % (-@b), -(@a % @b))
    end

    def test_multiply6
        assert_equal((-@a) % @b, -(@a % @b))
    end

    def test_multiply7
        assert_equal(@a % @a, @a^2)
        assert_equal(@a^0, @i)
    end

    def test_joint1
        assert_equal(@a % (@c + @d), (@a % @c) + (@a % @d))
    end

    def test_joint2
        assert_equal((@c + @d) % @a, (@c % @a) + (@d % @a))
    end

    def test_joint3
        assert_equal(-~@i,~-@i)
    end

    def test_joint4
        assert_equal(@a.t.t, @a)
    end

    def test_joint5
        assert_equal(@z.t, @z)
    end

    def test_joint6
        assert_equal(@i.t, @i)
    end

    def test_joint7
        assert_equal((@a+@b).t, @a.t+@b.t)
    end

    def test_joint8
        assert_equal((@a % @b).t, (@b.t) % (@a.t))
    end
end
