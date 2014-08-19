# should be a module if
# if types are never going to change
class Sign
	attr_accessor :type, :beats

	def initialize(type, beats=nil)
		@type = type
		@beats = beats || []
	end

	def beats?(other_sign)
		@beats.include?(other_sign.type)
	end
end
