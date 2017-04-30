module Blog
  class PostsController < ApplicationController

    before_action :authenticate_admin!, except: [:index, :show]

    def index
      @posts = Post.most_recent
    end   

    def show
      @post = Post.friendly.find(params[:id])
    end

  end
end