###Examples learned from Codeacademy however a superb demo of Ruby on Rails is from https://www.youtube.com/watch?v=pPy0GQJLZUM

#starting in terminal
rails new MySite
bundle install
rails server
http://localhost:8000

#create controller & inherit
#terminal
rails generate controller Pages

#ruby edit app/controllers/pages_controller.rb
class PagesController < ApplicationController
end

#edit the routers in config/routes.rb
Rails.application.routes.draw do

    get 'welcome' => 'pages#home'
    
#modify view app/views/pages/home.html.erb and see result in http://localhost:8000/welcome 
<div class="main">
	<div class="container">
		<h1>Hello my name is Mark.</h1>
		<p>I make Rails apps.</p>
	</div>
</div>

#model creation
#terminal
rails generate model Message

#get ready for database migration db/migrate/ 
t.text :content

#migrate to database
rake db:migrate

#final model creation part
rake db:seed

######################
#Creating controller

rails generate controller Messages

#in config/routes.rb route that maps the URL /messages to the Messages controller's index action
Rails.application.routes.draw do

get '/messages' => 'messages#index'


#app/controllers/messages_controller.rb), add an index action: ruby def index @messages = Message.all end

class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end
end

#modify view app/views/messages/index.html.erb
<% @messages.each do |message| %> 
	<div class="message"> 
	  <p class="content"><%= message.content %></p> 
	  <p class="time"><%= message.created_at %></p> 
	</div> 
	<% end %>

	</div># </div> added to this document just for styling purposes otherwise it prevents comments from being highlighted due to the code styling

##Write content from view to database
#in config/routes.rb 	new message creation command to go into database
	get '/messages/new' =>
	'messages#new'

	post 'messages' => 'messages#create'

	#app/controllers/messages_controller.rb) create controller to make new messages
	class MessagesController < ApplicationController
		def index
			@messages = Message.all
		end
		
		def new
			@message = Message.new
		end
		
		def create 
			@message = Message.new(message_params) 
			if @message.save 
				redirect_to '/messages' 
			else 
				render 'new' 
			end 
		end
		
		private 
			def message_params 
				params.require(:message).permit(:content) 
			end
	end

	#modify view tempalte app/views/messages/new.html.erb
	<%= form_for(@message) do |f| %>  
		<div class="field"> 
			<%= f.label :message %><br> 
			<%= f.text_area :content %> 
		</div> 
		<div class="actions"> 
			<%= f.submit "Create" %> 
		</div> 
	<% end %> 
	
	
	%># %> added to this document just for styling purposes otherwise it prevents comments from being highlighted due to the code styling
#modify home template in app/views/messages/index.html.erb
<%= link_to 'New Message', "messages/new" %> 

%># %> added to this document just for styling purposes otherwise it prevents comments from being highlighted due to the code styling
=begin
A model represents a table in the database.
A migration is a way to update the database with a new table, or changes to an existing table.
Rails provides seven standard controller actions for doing common things such as display and create data
Data can be displayed in the view using ERB web templating.
Data can be saved into the database using a web form.
=end


#####Associations

#created a model tag & modifying it app/models/tag.rb
class Tag < ActiveRecord::Base 
  has_many :destinations #Tag can have multiple Destinations
end

#create & modify model destination app/models/destination.rb
class Destination < ActiveRecord::Base
  belongs_to :tag #each Destination belongs to a single Tag
end

#changes to tag migration file to allow for title & image
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.timestamps
      |title|
        title.string
      |image|
        image.string
    end
  end
end

#changes to destination migration file to allow for name, image, description, tag (references)
class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
			t.string :name
			t.string :image
			t.string :description
			t.references :tag
      t.timestamps
    end
  end
end

#update our database migration
rake db:migrate

#Seed what we've done
rake db:seed

#Create Tags controller
rails generate controller Tags

#new route that maps requests to /tags to the Tags controller's index action in config/route.rb
Rails.application.routes.draw do
	get '/tags' => 'tags#index'
end

#loop through tags in @tags array app/views/tags/index.html.erb
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="tags">
  <div class="container">
    <div class="cards row">
    
      #Loop through tags and display each one with this HTML
      <div class="card col-xs-4">
        tag's image goes here
        <h2> tag's title goes here </h2>
      </div>

    </div>
  </div>
</div>


#Display sepcific tag in routes file
Rails.application.routes.draw do
	get '/tags' => 'tags#index'
  get '/tags/:id' => 'tags#show', as: :tag
end

#Tag controller add show action
class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end
	
	def show 
  	@tag = Tag.find(params[:id]) 
  	@destinations = @tag.destinations 
	end
end

#app/views/tags/show.html.erb show tag's title
=begin
By giving the route the name "tag", Rails automatically creates a helper method named tag_path. 
Use tag_path(t) here to generate the URL to a specific tag's path
=end
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="tag">
  <div class="container">
    <h2><%= @tag.title %></h2>

    <div class="cards row">
      <% @destinations.each do |d| %>
      <div class="card col-xs-4">
        <%= image_tag d.image %>
        <h2><%= d.name %></h2>
        <p><%= d.description %></p>
      </div>
      <% end %>
    </div>

  </div>
</div>

#create destination controller & modify routes
Rails.application.routes.draw do
	get '/tags' => 'tags#index'
	get '/tags/:id' => 'tags#show', as: :tag
  get '/destinations/:id'=>
    'destinations#show', as: :destination
end

#setup show method for destinations controller
class DestinationsController < ApplicationController
  
	def show 
	@destination = Destination.find(params[:id]) 
end
end

#app/views/destinations/show.html.erb, display the destination's image, name & description
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="destination">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">     
      </div>
    </div>
  </div>
</div> 

#app/views/tags/show.html.erb below a destination's description, use link_to to add a link to that destination
=begin
Use "See more" for the link text
By giving the show route a name of "destination", Rails automatically creates a helper method named destination_path. Use destination_path to generate a URL to a specific destination's path.
=end
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="tag">
  <div class="container">
    <h2><%= @tag.title %></h2>

    <div class="cards row">

      <div class="card col-xs-4">
        destination's image goes here
        <h2> destination's name goes here </h2>
        <p> destination description goes here </p>
      </div>

      <% @destinations.each do |d| %>
      <div class="card col-xs-4">
        <%= image_tag d.image %>
        <h2><%= d.name %></h2>
        <p><%= d.description %></p>
        <p><%= link_to "See more", destination_path(d) %></p>
      </div>
      <% end %>
    </div>

  </div>
</div>

####Update a destination

#config routes
get '/destinations/:id/edit' => 'destinations#edit', as: :edit_destination 
patch '/destinations/:id' => 'destinations#update'

#destination controller modified to handle updates
class DestinationsController < ApplicationController
	def show
    @destination = Destination.find(params[:id])
  end
  
  def edit 
  	@destination = Destination.find(params[:id]) 
	end
	
	def update
    @destination = Destination.find(params[:id])
      if @destination.update(destination_params)
        redirect_to @destination
      else
        render 'edit'
      end
  end
	
	private 
  	def destination_params 
    	params.require(:destination).permit(:name, :description) 
  	end
end

#app/views/destinations/edit.html.erb use form_for to create a form with the fields of the @destination object
#bind a form to a model object, which is exactly what form_for does
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="destination">
  <div class="container">
    <%= image_tag @destination.image %>
  </div>
</div> 

=begin
app/views/destinations/show.html.erb, use link_to to create a link to the destination's edit path:
Use "Edit" for the link text
By giving the edit route a name of "edit_destination", Rails automatically creates a helper method named edit_destination_path. Use it to generate a URL to a specific destination's edit path.
=end
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1tm.svg" width="80">
    <h1>BokenjiKan</h1>
  </div>
</div>

<div class="destination">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <%= image_tag @destination.image %>
        <h2><%= @destination.name %></h2>
        <p><%= @destination.description %></p>
        <%= link_to "Edit", edit_destination_path(@destination) %>
      </div>
    </div>
  </div>
</div>

=begin
We connected a Tag to its Destinations using associations. In this case, a tag has_many destinations, and a destination belongs_to one tag.
The has_many / belongs_to pair can be used to model other one-to-many relationships, which occur frequently.
=end

#######Many to Many associations

#Generate models Movie, Actor & Part
#app/models/movie.rb
class Movie < ActiveRecord::Base
  has_many :parts 
has_many :actors, through: :parts 
end

#app/models/actor.rb
class Actor < ActiveRecord::Base
  has_many :parts 
has_many :movies, through: :parts 
end

#app/models/part.rb
class Part < ActiveRecord::Base
  belongs_to :movie 
belongs_to :actor
end


# modify migration table fields db/migrate/ update migration process then seed it
class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
			t.string :title
			t.string :image
			t.string :release_year
			t.string :plot
      t.timestamps
    end
  end
end

class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
			t.string :first_name
			t.string :last_name
			t.string :image
			t.string :bio
      t.timestamps
    end
  end
end

class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
			t.belongs_to :movie, index: true #t.belongs_to is our foreign key since Parts is the bridge table for the Actor/Movies many to many relationship
			t.belongs_to :actor, index: true
      t.timestamps
    end
  end
end

rake db:migrate
rake db:seed


#Create the controllers map Movies to controller action
get '/movies' => 'movies#index'

#Movies controller, add the index action to display a list of all movies
class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
end

#app/views/movies/index.html.erb inside <div class="main"> iterate through each movie in @movies and display the image, title, and release year
<div class="hero">
  <div class="container">
    <h2>Interstellar</h2>
    <p>Former NASA pilot Cooper (Matthew McConaughey) and a team of researchers travel across the galaxy to find out which of three planets could be mankind new home.</p>
    <a href="#">Read More</a>
  </div>
</div>

<div class="main">
  <div class="container">
  <h2>Popular Films</h2>

    To do: Loop through movies and display each one with this HTML
    <div class="movie">
      movie image goes here
      <h3> movie title goes here </h3>
      <p> movie release year goes here </p>
    </div>

      
  </div>
</div>

###show specific movie in routes
get '/movies/:id' => 'movies#show', as: :movie


#Movies controller, add the show action to display a specific movie and its actors
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end
end

#app/view/movies/show.html.erb Inside <div class="movie">...</div>, display the movie's image, title, release year, and plot.
#Below <h2>Cast</h2>, iterate through each actor and display the image, first name, last name, and bio.
<div class="main movie-show">
  <div class="container">
    <div class="movie">
      
      <!-- Display the movie's info here -->
      <div class="info">
        <!-- movie image -->
        <h3 class="movie-title">  </h3>
        <p class="movie-release-year">  </p>
        <p class="movie-plot">  </p>
      </div>
    </div>

    <h2>Cast</h2>
    <!-- Display each actor's info here -->
    <div class="actor">
      <!-- actor image -->
      <h3 class="actor-name">  </h3>
      <p class="actor-bio">  </p>
    </div>

  </div>
</div>

#app/views/movies/index.html.erb below a movie's plot, use link_to to add a link to that movie
<div class="hero">
  <div class="container">
    <h2>Interstellar</h2>
    <p>Former NASA pilot Cooper (Matthew McConaughey) and a team of researchers travel across the galaxy to find out which of three planets could be mankinds new home.</p>
    <a href="#">Read More</a>
  </div>
</div>

<div class="main">
  <div class="container">
  <h2>Popular Films</h2>
    <% @movies.each do |movie| %>
    <div class="movie">
      <%= image_tag movie.image %>
      <h3><%= movie.title %></h3>
      <p><%= movie.release_year %></p>
      <p><%= movie.plot %></p>
      <%= link_to "Learn more", movie_path(movie) %>
    </div>
    <% end %>
  </div>
</div>


###see all movies an actor has appeared in
#create Actors controller

#modify routes to show all actors & hunt down specific one
get '/movies' => 'movies#index'
get '/movies/:id' => 'movies#show', as: :movie
get '/actors' => 'actors#index'
get '/actors/:id' => 'actors#show', as: :actor

#modify Actors controller to show all actors & display a specific actor and the filmography
class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end
	
	def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end
end


#Loop through actors in app/views/actors/index.html.erb & use link_to  so actor_path will generate a URL to a specific actor's path
<div class="main actor-index">
      <div class="container">
        <div class="row">

          <!--
          To do: Loop through movies and display each one with this HTML
          <div class="actor col-xs-2">
            actor image goes here
            <h3> actor name goes here </h3>
            <p> actor bio goes here </p>
          </div>
          -->
          
      </div>
</div>

#app/views/actors/show.html.erb:
#Display the actor's image, first name, last name, and bio.
#Then iterate through each movie and display its title, image, and release year
<div class="main actor-show">
  <div class="container">
    
    <!-- Display an actor's info here -->
    <div class="actor">
      <!-- actor image -->
      <div class="info">
        <h3 class="actor-name">  </h3>
        <p class="actor-bio">  </p>
      </div>
    </div>

    <h2>Movies</h2>
    <!-- Display each movie's info here -->
    <div class="movie">
      <!-- movie image -->
      <h3 class="movie-title">  </h3>
      <p class="movie-release-year">  </p>
      <p class="movie-plot">  </p>
    </div>

  </div>
</div>

=begin
Actors and movies can be modeled using a many-to-many relationship. In Rails, this can be implemented using a has_many :through association.
The has_many :through association joins two models via a third model.
=end