class Api::PostsController < ApplicationController

    def index
        if (params[:tags] && !params[:tags].empty?)

            # error handle params
            valid_fields = %w{id reads likes popularity}
            valid_dirs = %w{asc desc}
            if params[:sortBy] && !valid_fields.include?(params[:sortBy])
                return render json: {"error": "sortBy parameter is invalid"}, status: 400 
            end
            if params[:direction] && !valid_dirs.include?(params[:direction])
                return render json: {"error": "direction parameter is invalid"}, status: 400
            end 

            # model -> view
            @posts = Post.find_posts(params[:tags], params[:sortBy], params[:direction])
            render :index
        else
            # required param
            render json: {"error": "Tags parameter is required"}, status: 400
        end
    end
    
    def ping
        render json: {"success": true}
    end
end