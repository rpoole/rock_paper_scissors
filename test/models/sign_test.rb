require 'test_helper'

class SignModelTest < ActionController::TestCase
	def setup
		@sign1 = Sign.new('type1', ['type2'])
		@sign2 = Sign.new('type2')
	end

	test "should return true if sign is present in beats" do
		assert(@sign1.beats?(@sign2))
	end

	test "should return false if sign is not present in beats" do
		assert_not(@sign2.beats?(@sign1))
	end
end
