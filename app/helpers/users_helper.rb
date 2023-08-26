module UsersHelper
	class Person
		attr_reader :first_name, :last_name, :email

		def initialize(first_name, last_name, email)
			@first_name = first_name
			@last_name = last_name
			@email = email
		end

		def present
			"Hello, I'm #{@first_name} #{@last_name} and my email is #{@email}"
		end
	end
end
