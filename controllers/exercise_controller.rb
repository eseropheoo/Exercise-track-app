class ExercisesController < Sinatra::Base
	# sets root as the parent-directory of the current file
  	set :root, File.join(File.dirname(__FILE__), '..')
  
  	# sets the view directory correcty
  	set :views, Proc.new { File.join(root, "views") } 
  	set :public_folder, Proc.new { File.join(root, "public") } 

  	configure :development do
      	register Sinatra::Reloader
    end







end