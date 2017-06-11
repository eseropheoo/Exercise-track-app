class ExercisesController < Sinatra::Base
	# sets root as the parent-directory of the current file
  	set :root, File.join(File.dirname(__FILE__), '..')
  
  	# sets the view directory correcty
  	set :views, Proc.new { File.join(root, "views") } 
  	set :public_folder, Proc.new { File.join(root, "public") } 

  	configure :development do
      	register Sinatra::Reloader
    end


  	get '/' do

      @title = " Fit Track"
      # @fit = $exercise

      @fit = Exercise.all
  
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
	    @fit = Exercise.find id
	    
	    erb :'exercises/show'
    
  	end
    
  	post '/' do
    
  		fit = Exercise.new
      fit.title = params[:title]
      fit.username = params[:username]
      fit.target_muscle = params[:target_muscle]  
      fit.body = params[:body]  
      fit.days_trained = params[:days_trained]    
      fit.diet = params[:diet]    
      fit.reps = params[:reps]   
      fit.save
      redirect "/"
    
  	end
    
    
  	
    
  	
  	put '/:id'  do
    
    	 # Find correct post in array using id from url.
	    id = params[:id].to_i
	    # Change the parameters within that post (title and body).
      
	    username = params[:username]
      target_muscle = params[:target_muscle]    
      body = params[:body]      
      days_trained = params[:days_trained] ? params[:days_trained] : 0
      diet = params[:diet]    
      reps = params[:reps] ? params[:reps] : 0
          
      Exercise.find_and_update(id, username, target_muscle, body, days_trained, diet, reps)  
      redirect "/"

		end
    
 	  delete '/:id'  do
      id = params[:id].to_i
      Exercise.destroy id
      redirect "/"

	  end
    
  	get '/:id/edit'  do
  		id = params[:id].to_i
    	@fit = Exercise.find id
    
    	erb :"exercises/edit"
    
    end







end