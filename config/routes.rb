Rails.application.routes.draw do
  root "workout_recommender#index"

  get "workout_recommender/results"
  post "/" => "workout_recommender#EnterInfo"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/Workouts", to: "Workouts#index"

end
