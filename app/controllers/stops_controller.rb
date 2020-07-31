class StopsController < ApplicationController
    before_action :find_stop, only: [:destroy]


    def create
        @stop = Stop.create(stop_params)
        
        render json: @stop, status: :created
    end

    def destroy
        @stop.destroy

        render json: { alert: "Stop removed from Crawl" }, status: :no_content
    end

    private

    def stop_params
        params.require(:stop).permit(:crawl_id, :brewery_id, :pub_name, :pub_address, :brewery_latitude, :brewery_longitude, :website)
    end

    def find_stop
        @stop = Stop.find(params[:id])
    end

end 
