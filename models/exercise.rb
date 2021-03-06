class Exercise
    attr_accessor :title, :id, :username, :target_muscle, :body, :days_trained, :diet, :reps, :image

    def self.open_connection
        if ENV['DATABASE_URL']
            PG.connect({
                dbname: ENV['DB_NAME'], 
                host: ENV['DB_HOST'],
                port: ENV['DB_PORT'],
                user: ENV['DB_USERNAME'],
                password: ENV['DB_PASSWORD']
            })
        else
            PG.connect(dbname: "exercise")
        end
    end

    def self.hydrate exercise_data
        exercise = self.new
        exercise.title = exercise_data['title']
        exercise.id = exercise_data['id']
        exercise.username = exercise_data['username']
        exercise.target_muscle = exercise_data['target_muscle']
        exercise.body = exercise_data['body']
        exercise.days_trained = exercise_data['days_trained']
        exercise.diet = exercise_data['diet']
        exercise.reps = exercise_data['reps']
        exercise.image = exercise_data['image']

        exercise
    end
    # INDEX
    def self.all
        conn = self.open_connection
        sql = "SELECT title,id,username,target_muscle, body,days_trained,diet,reps,image FROM fit ORDER BY id"
        results = conn.exec(sql)

        # create an array of exercise objects
        exercises = results.map do |tuple| 
            self.hydrate tuple
        end

        exercises
    end
    def self.find id
        conn = self.open_connection
        sql = "SELECT title,id,username,target_muscle,body,days_trained,diet,reps,image FROM fit WHERE id = #{id}"
        results = conn.exec(sql)

        self.hydrate results.first
    end

    def save
        conn = Exercise.open_connection
        sql = "INSERT INTO fit (title, username,target_muscle,body,days_trained,diet,reps,image) VALUES ('#{self.title}', '#{self.username}', '#{self.target_muscle}', '#{self.body}', '#{self.days_trained}', '#{self.diet}', '#{self.reps}', '#{self.image}')"
        conn.exec(sql)
    end

    def update
        conn = Exercise.open_connection
        sql = "UPDATE fit SET username='#{self.username}', target_muscle= '#{self.target_muscle}', body='#{self.body}', days_trained= '#{self.days_trained}', 
        diet= '#{self.diet}', reps= '#{self.reps}', image= '#{self.image}'
         WHERE id = #{self.id}"
        conn.exec(sql)
    end
    

    def self.find_and_update id, username, target_muscle, body, days_trained, diet, reps
        conn = self.open_connection
        sql = "UPDATE fit SET username='#{username}', target_muscle='#{target_muscle}', body='#{body}', days_trained='#{days_trained}', 
         diet='#{diet}', reps='#{reps}' WHERE id = #{id}"
        results = conn.exec(sql)
    end

    def self.destroy id 
        conn = self.open_connection
        sql = "DELETE FROM fit WHERE id = #{id}"
        conn.exec(sql)
    end
end

