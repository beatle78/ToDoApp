module ToDoApp
  module Controllers
    module Users
      include ToDoApp::Controller

     
      action "New" do
        def call(params)
        end
      end
      
      action "Create" do

        def call(params)
          # Hier wird ein neues Userobjekt angelegt
          new_user = ToDoApp::Models::User.new({
            email: params[:email], # params[:email] => Benutzereingabe im Formular
            password: params[:password] # params[:password] => Benutzereingabe im Formular
            }) # Userobjekt in der Datenbank speichern
          
          if !new_user.email.nil? && !new_user.email.strip.empty?
            ToDoApp::Repositories::UserRepository.create(new_user)
          end

          redirect_to "/"
        end

      end

      action "Signin" do

        def call(params)
        end  
      end


    end
  end
end
