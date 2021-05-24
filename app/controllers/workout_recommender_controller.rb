'''
TODO:

  1) Clear Library and re-populate with all the entries
  2) Figure out how to show the matched URL on the index home page
  3) How to see the database in our terminal
  4) How to clear Match after every time someone fills out the form
  5) Better HTML formatting
'''

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
    Match.delete_all
    name = params[:nameInput]
    age = params[:ageInput].to_f
    workout_type = params[:workout_typeInput]
    duration = params[:durationInput]
    intensity = params[:intensityInput]

    results = Library.find_by workout_type: workout_type, duration: duration, intensity: intensity    
    if results.present?
      map = {'url'=>results.url}
      newRow = Match.new(map)
      respond_to do |format|
        if newRow.save
          puts "Success!"
          format.html {redirect_to '/'} #redirect to results
        end
      end
    else
      results = Library.find_by workout_type: workout_type, intensity: intensity
      if results.present?
        map = {'url'=>results.url}
        newRow = Match.new(map)
        respond_to do |format|
          if newRow.save
            puts "Success!"
            format.html {redirect_to '/'} #redirect to results
          end
        end
      else
        results = Library.find_by workout_type: workout_type
        if results.present?
          map = {'url'=>results.url}
          newRow = Match.new(map)
          respond_to do |format|
            if newRow.save
              puts "Success!"
              format.html {redirect_to '/'} #redirect to results
            end
          end
        else
          respond_to do |format|
          format.html {redirect_to '/'} #Can create an error page
          end
        end
      end
    end
  end

  def DisplayResults
    puts "INSIDE DISPLAY RESULTS!!!!!!!!!!!!!!!!!!!!!!"

  end


end
