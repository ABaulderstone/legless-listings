class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    
    def create 
        #create new listing
        
       @listing = Listing.create(listing_params)
       byebug
    end 
    def update 
        #updates current listing
    end 
    def index 
        #shows all listings
        @listings = Listing.all
    end 
    def edit 
        #shows edit form 
    end 
    def destroy 
        #delete current listing
    end 
    def new 
        #shows create form 
        @listing = Listing.new
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end 
    def show 
        #shows current listing
        
    end 

    private 
    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet)
    end 
    
    def set_listing 
        id = params[:id]
        @listing = Listing.find(id)
    
    end 
end 