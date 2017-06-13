##FIT-Track 

#Objective:

Fit track is an individual Spartan project, to implented our understanding of front and back end CRUD web application, the use of a database and fully functional restful routes. 

The main objectives include:

* Have at least **ONE** resource.
* All seven routes functioning.
* Style the webpage with CSS.
* Be uploaded to a web host (e.g Heroku).

##Pre-installation: how to deploy the app.

1. You will first need to git clone the repository into your local host.
2. You will need to (if you haven't) download an SQL database, called Postgres. 
3. CREATE DATABASE **exercise**
4. \c exercise (accesses the database)
5. CREATE TABLE fit (
	
	title VARCHAR(255) NOT NULL,
	
	id SERIAL NOT NULL,
	
	username VARCHAR(255) NOT NULL,
	
	target_muscle TEXT NOT NULL,
	
	body TEXT  NOT NULL,
	
	days_trained SERIAL NOT NULL,
	
	diet TEXT NOT NULL,
	
	reps SERIAL NOT NULL,
	
	image IMAGE NOT NULL );
	
6. After creating the columns an MVC (model- view-controller) needs to be created.
7. First install bundler init on bash to create a gemfile.
8. After producing the correct file paths. Using your git clone file paste the model, controller, html, erb and css.
9. You should have a homepage like this:




##Challenges

The main challenges about this creating this app was the css/styling. The displays were difficult to arrange and quick to shift if another object was placed on the page. The main problem was padding and widith were preventing certain elements to move and align. Wrapping certain elements in divs and giving each one within a div overcome most of that issue. 

Another big issue was deploying my app to heroku. I was recieving numerous internal server errors and after many configurations managed to get it to deploy but not without the styling becoming affected.

##Achievements 

* Being able to deploy the back-end CRUD application with little difficulty. Finding bug-finding easier.

* Being able to at the end create a satisfying web design for my app.

* Creating a facebook fan page for my app.

* Allowing users to upload their image with their created exercise with a url.

##Conclusion

This project took a total of three days. Despite the obstacles met, I'm proud with what I've accoplished in such a short amount of time, being able to use what I've learned has helped me gain a far better understanding of the technolgies I've learned during my training.
		


