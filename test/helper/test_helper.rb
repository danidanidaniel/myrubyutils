# -*- coding: utf-8 -*-

require 'simplecov'
SimpleCov.start do
	add_filter 'test'
	add_group 'Libraries', 'lib'
end