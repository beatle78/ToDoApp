module ToDoApp
  module Controllers
    module Home
      include ToDoApp::Controller

      action 'Index' do
        expose :task

        def call(params)
          @task = params[:task]
        end
      end
    end
  end
end
