class Exercise
    attr_accessor :id, :username, :target_muscles, :days_trained, :diet, :reps

    def self.open_connection
        PG.connect(dbname: "exercise")
    end
    def self.hydrate exercise_data
        exercise = self.new
        exercise.id = exercise_data['id']
        exercise.username = exercise_data['username']
        exercise.target_muscles = exercise_data['target_muscles']
        exercise.days_trained = exercise_data['days_trained']
        exercise.diet = exercise_data['diet']
        exercise.reps = exercise_data['reps']

        exercise
    end
    # INDEX
    def self.all
        conn = self.open_connection
        sql = "SELECT id,username,target_muscles,days_trained,diet,reps FROM fit ORDER BY id"
        results = conn.exec(sql)

        # create an array of exercise objects
        exercises = results.map do |tuple| 
            self.hydrate tuple
        end

        exercises
    end
    def self.find id
        conn = self.open_connection
        sql = "SELECT id,username,target_muscles,days_trained,diet,reps FROM fit WHERE id = #{id}"
        results = conn.exec(sql)

        self.hydrate results.first
    end
end

