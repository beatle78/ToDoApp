

module ToDoApp
  module Controllers
    module Home
      include ToDoApp::Controller

      action 'Index' do
        include Lotus::Action::Session
        expose :tasks
        expose :user


        def call(params)

          user_id = session[:user]
          puts "SESSION: #{user_id}"

          if params[:newest]
            @tasks = ToDoApp::Repositories::TaskRepository.latest_tasks(user_id)
          elsif params[:alphabetically]
            @tasks = ToDoApp::Repositories::TaskRepository.alphabetically(user_id)
          else
            @tasks = ToDoApp::Repositories::TaskRepository.for_user(user_id)
          end

            @user = ToDoApp::Repositories::UserRepository.by_id(session[:user])
        end
      end

      action "Create" do
        include Lotus::Action::Session
        def call(params)

          new_task = ToDoApp::Models::Task.new({
            name: params[:task],
            user_id: session[:user]
            })
          if !new_task.name.nil? && !new_task.name.strip.empty?
            ToDoApp::Repositories::TaskRepository.create(new_task)
          end

          redirect_to "/"
        end

      end
      #CRUD
      #Create Read Update Delete
      #Seperation of Concerns


      action 'Delete' do

        def call(params)
          task = ToDoApp::Repositories::TaskRepository.find(params[:task_id])
          ToDoApp::Repositories::TaskRepository.delete(task)

          redirect_to '/' #lotusmethode
        end
      end



    end
  end
end
