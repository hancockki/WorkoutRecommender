class WorkoutRecommenderController < ApplicationController
  def index
    @returnedEntries = Match.all
  end


  def DataEntry
    workout_type = params[:workout_typeInput]
    duration = params[:durationInput]
    intensity = params[:intensityInput]
    url = params[:URLInput]

    map = {"workout_type" => workout_type, "duration"=>duration, "intensity"=>intensity, "url"=>url}
    newRow = Library.new(map)
    respond_to do |format|
      if newRow.save
        puts "Success!"
        format.html {redirect_to workout_recommender_dataentry_url} #redirect to results
      else
        format.html {redirect_to "/"} #Can create an error page
      end
    end
  end


  def EnterInfo
    name = params[:nameInput]
    age = params[:ageInput].to_f
    workout_type = params[:workout_typeInput]
    duration = params[:durationInput]
    intensity = params[:intensityInput]

   #for @allData.each do |format|:
      #find the matches
      #enter that match into a match table, which is a new table in the same database
    #end
    

    #map = {"name" => name, "age" => age, "workout_type" => workout_type, "duration"=>duration, "intensity"=>intensity}
    #newRow = UserDatum.new(map)
    respond_to do |format|
      #if newRow.save
        #puts "Success!"
      format.html {redirect_to '/'} #redirect to results
    #else
    #format.html {redirect_to "/"} #Can create an error page
      #end
    end
  end



  def GetResults(workout_type, duration, intensity)
    puts workout_type, duration, intensity

    @returnedEntries = UserDatum.connection.select_all("select * from library where type = '" + workout_type + \
       "' and duration = '" + duration + "' and intensity = '" + intensity + "';")
    puts "success"
    return @returnedEntries

  end


end
