module Math
	def self.max(*arg)
		return -Float::INFINITY if arg.empty?
		return 0 if arg[0].nil?
		return 0 if arg[0].is_a? Array
		return arg.max
	end
	def self.min(*arg)
		return Float::INFINITY if arg.empty?
		return 0 if arg[0].nil?
		return 0 if arg[0].is_a? Array
		return arg.min
	end
end