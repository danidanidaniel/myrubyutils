# instanceのフィールドにハッシュを用いて動的にフィールドを定義する.
# key => フィールド名
# value => フィールドの値
# ハッシュが入れ子になっている場合は
# ハッシュの階層構造を維持したクラスとして定義した上で同様に処理する.
module ActiveClassGenerator
	def define_fields_by_hash(instance, hash)
		hash.each do |k, v|
			class_name = to_camelcase(k)
			instance.class.const_set(class_name, Class.new) unless instance.class.const_defined?(class_name)
			instance.class.class_eval { attr_accessor k }
			if v.kind_of? Hash
				obj = instance.class.const_get(class_name).new
				define_fields_by_hash(obj, v)
				instance.send(k + '=', obj)
			elsif v.kind_of? Array
				obj = instance.class.const_get(class_name).new
				array_obj = instance.send(k)
				array_obj = [] unless array_obj
				v.each do |val|
					if val.kind_of? Hash
						hash_instance = Class.new
						define_fields_by_hash(hash_instance, val)
						array_obj << hash_instance
					else
						array_obj << val
					end
				end
				instance.send(k + '=', array_obj)
			else
				instance.send(k + '=', v)
			end
		end
	end

	private
	def to_camelcase(str)
  		str.split('_').map{|s| s.capitalize}.join('')
	end
end