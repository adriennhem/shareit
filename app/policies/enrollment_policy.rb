class EnrollmentPolicy < ApplicationPolicy

def show 
	scope.where(:id => record.id).exists?
	record.user == user
end 


end