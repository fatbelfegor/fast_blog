module Blog
  class PostsController < ApplicationController

    before_action :authenticate_admin!, except: [:index, :show]

    def index
      @posts = storage.list_for(params[:page], params[:tag])
    end

    def show
      @post = storage.friendly.find(params[:id])
    end

     private

    def storage
      Post.published
    end

  end
end