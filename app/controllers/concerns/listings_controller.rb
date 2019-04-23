class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authorise_user, only: [:edit, :update, :destroy]
    before_action :set_breeds_and_sexes, only: [:new, :edit]
    
    
    def create 
        #create new listing
        @listing = current_user.listings.create(listing_params)
       if @listing.errors.any?
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
        render "new" 

        
       else 
        redirect_to listings_path
       end 
       
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

    end 
    def show 
        #shows current listing
        
    end 

    private 
    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :picture)
    end 
    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys

    end 

    def authorise_user
       if @listing.user_id != current_user.id
        redirect_to listings_path
       end
    end
   
    def set_listing 
        id = params[:id]
        @listing = Listing.find(id)
    
    end 
end 