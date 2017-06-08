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
      Reps: "15"
  	},
  	{
      id: 1,
      name: "Squats",
      target_muscles: "thighs, glutes, calves",
      Reps: "100",
  	},
  	{
      id: 2,
      name: "situps",
      target_muscles: "abdomen"
      Reps: "50",
  	}]






end