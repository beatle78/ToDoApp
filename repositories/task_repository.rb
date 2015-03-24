module ToDoApp
	module Repositories
		class TaskRepository
			include Lotus::Repository

			#Aufgaben fuer einen bestimmten Benutzer laden
			def self.for_user(user_id)
				query do
					#SELECT * FROM users WHERE user_id = x
					#(x entspricht dem Parameter user_id)
					where(user_id: user_id)
				end
			end

			# Sortiermethoden 1. das letzte zum Schluss / 2.Alphabetisch
			def self.latest_tasks(user_id)
			  query do
					#sort descending by id
				  where(user_id: user_id).desc(:id)
			  end
			end

			def self.alphabetically(user_id)
			  query do
			  	#sort name ascending
					where(user_id: user_id).asc(:name)
			  end
			end
		end
	end
end
