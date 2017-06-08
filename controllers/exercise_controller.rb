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

    get '/new'  do
    	@title = "Fit Track"
    	
    	erb :'/exercises/new'
    
  	end

  	get '/:id' do
    
	    # get the ID and turn it in to an integer
	    id = params[:id].to_i

	    # make a single post object available in the template
	    @fit = $exercise[id]
	    
	    erb :'exercises/show'
    
  	end
    
  	post '/' do
    
		fit = {
	      id: $exercise.length,
	      name: params[:name],
	      target_muscles: params[:target_muscles],
	      reps: params[:reps]
	    }
	    puts fit
	    $exercise.push fit
	    redirect "/"    
    
  	end
    
    
  	
    
  	
  	put '/:id'  do
    
    	 # Find correct post in array using id from url.
	    id = params[:id].to_i
	    # Change the parameters within that post (title and body).
	    $exercise[id][:name] = params[:name]
	    $exercise[id][:target_muscles] = params[:target_muscles]
	    $exercise[id][:reps] = params[:reps]

		redirect "/"
    
  	end
    
 	delete '/:id'  do
    
   		id = params[:id].to_i
   		$exercise.delete_at(id)
   		
  	end
   		 redirect "/"

	end
    
  	get '/:id/edit'  do
  		id = params[:id].to_i
    	@fit = $exercise[id]
    
    	erb :"exercises/edit"
    
  	end







end