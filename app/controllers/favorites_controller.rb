class FavoritesController < ApplicationController
    before_action :find_favorite, only: [:destroy]

    def create
        @favorite = Favorite.create(
            brewery_id: params[:favorite]['brewery_id'],
            pub_name: params[:favorite]['pub_name'],
            user_id: @user.id
            )

        render json: { favorite:@favorite, alert: 'Added to your Favorites' }, status: :created
    end

    def destroy
        @favorite.destroy
        render json: { alert: 'Removed from Favorites' }, status: :no_content
    end

    private

    def find_favorite
        @favorite = Favorite.find(params[:id])
    end
end
