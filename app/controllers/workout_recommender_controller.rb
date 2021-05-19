class WorkoutRecommenderController < ApplicationController
  def index
  end

  def EnterInfo
    name = params[:nameInput]
    age = params[:ageInput].to_f
    workout_type = params[:workout_typeInput]
    duration = params[:durationInput]
    intensity = params[:intensityInput]
    
    map = {"name" => name, "age" => age, "workout_type" => workout_type, "duration"=>duration, "intensity"=>intensity}
    newRow = UserDatum.new(map)
    respond_to do |format|
      if newRow.save
        puts "Success!"
        format.html {redirect_to workout_recommender_results_url}
      else
        format.html {redirect_to "/"} #Can create an error page
      end
    end
  end


  def results
  end


end
