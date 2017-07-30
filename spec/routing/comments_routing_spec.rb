require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/comments").to route_to("comments#index")
    end

    it "routes to #new" do
      expect(:get => "/movies/1/comments/new").to route_to("comments#new", :movie_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/movies/1/comments/1").to route_to("comments#show", :movie_id => "1", id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/movies/1/comments/1/edit").to route_to("comments#edit", :movie_id => "1", id: '1')
    end

    it "routes to #create" do
      expect(:post => "/movies/1/comments").to route_to("comments#create", movie_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/movies/1/comments/1").to route_to("comments#update", :id => "1", movie_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/movies/1/comments/1").to route_to("comments#update", :id => "1", movie_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/movies/1/comments/1").to route_to("comments#destroy", :id => "1", movie_id: '1')
    end

  end
end
