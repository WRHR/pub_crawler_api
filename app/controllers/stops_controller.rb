class StopsController < ApplicationController
    before_action :find_stop, only: [:destroy]

    def create
        @stop = Stop.create(stop_params)
        
        render json: {stop: @stop, alert: "Stop added to Crawl"}
    end

    def destroy
        @stop.destroy

        render json: { alert: "Stop removed from Crawl" }, status: :no_content
    end

    private

    def stop_params
        params.require(:stop).permit(:crawl_id, :pub_name, :pub_address, :pub_latitude, :pub_longitude, :website)
    end

    def find_stop
        @stop = Stop.find(params[:id])
    end

end 
