module ToDoApp
  module Controllers
    module Sessions
      include ToDoApp::Controller

      
     action "Create" do
      include Lotus::Action::Session
        def call(params)
          # Hier wird eine Session angelegt
          user = ToDoApp::Repositories::UserRepository.find_by_email_and_password(
            params[:email],
            params[:password]
            )
          if user.nil?
            #user not found
            redirect_to "/users/signin"
          else
            #found something
            session[:user] = user.id
            redirect_to "/"
          end
        end
      end

     action "Signout" do
      include Lotus::Action::Session
        def call(params)
          # Hier wird eine Session gelöscht
          session[:user] = nil
            redirect_to "/"
        end
      end
    end
  end
end
