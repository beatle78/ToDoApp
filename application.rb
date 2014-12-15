require 'lotus'
require 'lotus/model'
module ToDoApp
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index'
        post '/', to: 'home#index'
        post '/tasks/delete', to: 'home#delete'
        get '/impressum', to: 'imprint#page'
      end

      load_paths << [
        'controllers',
        'models',
        'views',
        'repositories'
      ]
      layout :application
    end

    load!
  end

  CONNECTION_URI = "sqlite://#{ __dir__ }/test.db"
  
  Lotus::Model.configure do
    adapter type: :sql, uri: CONNECTION_URI

    mapping do
    collection :tasks do
      entity     ToDoApp::Models::Task
      repository ToDoApp::Repositories::TaskRepository

      attribute :id,   Integer
      attribute :name, String
    end
  end
end

Lotus::Model.load!
end
