require 'pg'

class DatabaseSetup
	def self.open_connection
	    PG.connect({
	        dbname: ENV['DB_NAME'], 
	        host: ENV['DB_HOST'],
	        port: ENV['DB_PORT'],
	        user: ENV['DB_USERNAME'],
	        password: ENV['DB_PASSWORD']
	    })
	end

	def self.go
		conn = self.open_connection

		sql = "CREATE TABLE fit (
		title TEXT NOT NULL,
		id SERIAL NOT NULL,
		username VARCHAR(200) NOT NULL,
		target_muscle TEXT NOT NULL,
		body TEXT NOT NULL,
		days_trained SERIAL NOT NULL,
		diet TEXT NOT NULL,
		reps SERIAL NOT NULL,
		image VARCHAR(100) NOT NULL
		PRIMARY KEY (id)
		);"

		conn.exec(sql)
	end
end

DatabaseSetup.go