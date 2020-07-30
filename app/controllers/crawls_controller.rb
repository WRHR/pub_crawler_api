class CrawlsController < ApplicationController
    before_action :find_crawl, only: [:update, :destroy]
    skip_before_action :authorized, only: [:index]

    def index
        @crawls = Crawl.all
        render json: @crawls, include: [:user]
    end

    def create 
        @crawl = Crawl.create(name: params[:name], user_id: current_user.id)
        render json: { crawl: @crawl, alert: "Crawl Created" }, status: :created
    end

    def update
        @crawl.update( name: params[:name] )

        render json: { alert: "Crawl Updated" }, status: :accepted
    end

    def destroy
        @crawl.destroy

        render json: { alert: "Crawl Deleted" }, status: :no_content
    end

    private

    def find_crawl
        @crawl = Crawl.find(params[:id])
    end
end
