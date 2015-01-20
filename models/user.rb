module ToDoApp
	module Models
	  	class User
	  	   include Lotus::Entity
	  	   self.attributes = :email, :password
	  	end
	end
end	
