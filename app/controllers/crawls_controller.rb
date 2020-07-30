class CrawlsController < ApplicationController
    before_action :find_crawl, only: [:update, :destroy]

    def index
        @crawls = Crawl.all
        render json: @crawls
    end

    def create 
        @crawl = Crawl.create(crawl_params, user: current_user)
        render json: { crawl: @crawl, alert: "Crawl Created" }, status: :created
    end

    def update
        @crawl.update{ name: params[:name] }

        render json: { alert: "Crawl Updated" }, status: :accepted
    end

    def destroy
        @crawl.destroy

        render json: { alert: "Crawl Deleted" }, status: :no_content
    end

    private

    def crawl_params
        params.require(:crawl).permit(:name)
    end

    def find_crawl
        @crawl = Crawl.find(params[:id])
    end
end
