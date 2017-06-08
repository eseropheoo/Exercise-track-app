class ExercisesController < Sinatra::Base
	# sets root as the parent-directory of the current file
  	set :root, File.join(File.dirname(__FILE__), '..')
  
  	# sets the view directory correcty
  	set :views, Proc.new { File.join(root, "views") } 
  	set :public_folder, Proc.new { File.join(root, "public") } 

  	configure :development do
      	register Sinatra::Reloader
    end

    $exercise = [{
      id: 0,
      name: "pushups",
      target_muscles: "arms,upper back, shoulders",
      reps: "15"
  	},
  	{
      id: 1,
      name: "Squats",
      target_muscles: "thighs, glutes, calves",
      reps: "100"
  	},
  	{
      id: 2,
      name: "situps",
      target_muscles: "abdomen",
      reps: "50"
  	}]

  	get '/' do

      @title = " Fit Track"

      @fit = $exercise
  
      erb :'exercises/index'
  
    end

  	get '/:id' do
    
	    # get the ID and turn it in to an integer
	    id = params[:id].to_i

	    # make a single post object available in the template
	    @fit = $exercise[id]
	    
	    erb :'exercises/show'
    
  	end
    
  	post '/' do
    
  	  "CREATE"

    
    
  	end
    
    
  	get '/new'  do
    
    	erb :'/exercises/new'
    
  	end
    
  	
  	put '/:id'  do
    
    	"UPDATE: #{params[:id]}"
    
  	end
    
 	delete '/:id'  do
    
   		 "DELETE: #{params[:id]}"
    
  	end
    
  	get '/:id/edit'  do
    
    	"EDIT: #{params[:id]}"
    
  	end







end