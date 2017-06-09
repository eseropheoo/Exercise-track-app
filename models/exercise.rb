class Exercise
    attr_accessor :title, :id, :username, :target_muscle, :body, :days_trained, :diet, :reps

    def self.open_connection
        PG.connect(dbname: "exercise")
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

        exercise
    end
    # INDEX
    def self.all
        conn = self.open_connection
        sql = "SELECT title,id,username,target_muscle, body,days_trained,diet,reps FROM fit ORDER BY id"
        results = conn.exec(sql)

        # create an array of exercise objects
        exercises = results.map do |tuple| 
            self.hydrate tuple
        end

        exercises
    end
    def self.find id
        conn = self.open_connection
        sql = "SELECT title,id,username,target_muscle,body,days_trained,diet,reps FROM fit WHERE id = #{id}"
        results = conn.exec(sql)

        self.hydrate results.first
    end

    def save
        conn = Post.open_connection
        sql = "INSERT INTO fit (title,id,username,target_muscle,body,days_trained,diet,reps) 
        VALUES ( '#{self.title}', '#{self.username}', #{self.target_muscle}', '#{self.body}', '#{self.days_trained}', '#{self.diet}', '#{self.reps}')"
        conn.exec(sql)
    end

    def update
        conn = Post.open_connection
        sql = "UPDATE fit SET title='#{self.title}', username='#{self.username}', target_muscle= '#{self.target_muscle}', body='#{self.body}', days_trained= '#{self.days_trained}', 
        diet= '#{self.diet}', reps= '#{self.reps}' 
         WHERE id = #{self.id}"
        conn.exec(sql)
    end
    

    def self.find_and_update id, title, username, target_muscle, body, days_trained, diet, reps
        conn = self.open_connection
        sql = "UPDATE fit SET title='#{title}', body='#{body}' WHERE id = #{id}"
        results = conn.exec(sql)
    end

end

