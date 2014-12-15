module ToDoApp
  module Controllers
    module Home
      include ToDoApp::Controller

      action 'Index' do
        expose :tasks

        def call(params)

          new_task = ToDoApp::Models::Task.new({name: params[:task]})
          if !new_task.name.nil? && !new_task.name.strip.empty?
            ToDoApp::Repositories::TaskRepository.create(new_task)
          end

          @tasks = ToDoApp::Repositories::TaskRepository.all
        end
      end

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
