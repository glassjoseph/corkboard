class ProDashboard::OpenProjectsController < ApplicationController
  attr_accessor :to_bid_on
  def index
    #add in filter about open/closed status of project
    @pro = Pro.find(current_user.id)
#    @pro_location = Geokit::Geocoders::GoogleGeocoder.geocode(@pro.zipcode)
    @open_projects = @pro.open_projects

    @to_bid_on = @pro.open_projects

 #   @open_projects.each do |open_project|
  #    request_location = open_project.zipcode
   #   distance = @pro_location.distance_to(request_location)
    #  if distance < @pro.pro_service.radius.to_i
     #   @to_bid_on << open_project
     
  #else
   #   end
    end
    # request_location = Geokit::Geocoders::GoogleGeocoder.geocode(@pro.zipcode)

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
end
