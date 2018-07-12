# -*- coding: utf-8 -*-

require 'test/unit'
require '../utils/math4js'

class Math4JSTest < Test::Unit::TestCase

  # test for max
  def test_max_non_arg
    expected = -Float::INFINITY
    assert_equal(expected, Math.max())
  end

  def test_max_nil
    expected = 0
    assert_equal(expected, Math.max(nil))
  end

  def test_max_empty_array
    expected = 0
    assert_equal(expected, Math.max([]))
  end

  def test_max_0
    expected = 0
    assert_equal(expected, Math.max(0))
  end

  def test_max_1_arg
    expected = 1
    assert_equal(expected, Math.max(1))
  end

  def test_max_1or2
    expected = 2
    assert_equal(expected, Math.max(1, 2))
  end

  def test_max_1orminus2
    expected = 1
    assert_equal(expected, Math.max(1, -2))
  end

  def test_max_minus1or2
    expected = 2
    assert_equal(expected, Math.max(-1, 2))
  end

  # test for min
    def test_min_non_arg
    expected = Float::INFINITY
    assert_equal(expected, Math.min())
  end

  def test_min_nil
    expected = 0
    assert_equal(expected, Math.min(nil))
  end

  def test_min_empty_array
    expected = 0
    assert_equal(expected, Math.min([]))
  end

  def test_min_0
    expected = 0
    assert_equal(expected, Math.min(0))
  end

  def test_min_1_arg
    expected = 1
    assert_equal(expected, Math.min(1))
  end

  def test_min_1or2
    expected = 1
    assert_equal(expected, Math.min(1, 2))
  end

  def test_min_1orminus2
    expected = -2
    assert_equal(expected, Math.min(1, -2))
  end

  def test_min_minus1or2
    expected = -1
    assert_equal(expected, Math.min(-1, 2))
  end

end
