Rails.application.routes.draw do
  root "workout_recommender#index"

  get "workout_recommender/dataentry"
  post "/" => "workout_recommender#EnterInfo"
  post '/workout_recommender/dataentry' => "workout_recommender#DataEntry"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/Workouts", to: "Workouts#index"

end
