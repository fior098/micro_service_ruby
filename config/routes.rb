Rails.application.routes.draw do
  resources :students, only: [:create, :destroy]

  scope '/schools/:school_id' do
    get '/classes', to: 'schools/classes#index'
    get '/classes/:class_id/students', to: 'schools/class_students#index'
  end
end
