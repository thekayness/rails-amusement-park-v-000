class AttractionPolicy < ApplicationPolicy
	def create?
		user.admin?
	end

	def update?
		puts "heeeeeey"
		user.admin?
	end
end