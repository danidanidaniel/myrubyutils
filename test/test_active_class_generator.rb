
require 'test/unit'
require '../utils/active_class_generator'

class ActiveClassGeneratorTest < Test::Unit::TestCase

	@test_instance

	class TestInstance
	end

	def setup
		@test_instance = TestInstance.new
		@test_instance.extend(ActiveClassGenerator)
	end

	def test_1field
		hash = {"a" => 1}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a, 1)
	end

	def test_2field
		hash = {"a" => 1, "b" => 10}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a, 1)
		assert_equal(@test_instance.b, 10)
	end

	def test_3field
		hash = {"a" => 1, "b" => 10, "c" => 100}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a, 1)
		assert_equal(@test_instance.b, 10)
		assert_equal(@test_instance.c, 100)
	end

	def test_1nested_hash_field
		hash = {"a" => {"b" => 1}}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a.b, 1)
	end

	def test_2nested_hash_field
		hash = {"a" => {"b" => {"c" => 1}}}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a.b.c, 1)
	end

	def test_array_field
		hash = {"a" => [1,2,3]}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a, [1, 2, 3])
	end

	def test_nested_array_field
		hash = {"a" => {"b" => [1,2,3]}}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a.b, [1, 2, 3])
	end
	def test_nested_hash_array_field
		hash = {"a" => {"b" => [{"c" => 1}]}}
		@test_instance.define_fields_by_hash(@test_instance, hash)
		assert_equal(@test_instance.a.b[0].c, 1)
	end

end