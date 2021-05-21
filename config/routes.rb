Rails.application.routes.draw do
  root "workout_recommender#index"

  get "workout_recommender/dataentry"
  get "workout_recommender/results"

  post "/" => "workout_recommender#EnterInfo"
  post '/workout_recommender/dataentry' => "workout_recommender#DataEntry"
  get '/' => "workout_recommender#DisplayResults"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get "/Workouts", to: "Workouts#index"

end
