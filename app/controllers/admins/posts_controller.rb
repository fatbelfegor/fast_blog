module Admins
  class PostsController < ApplicationController

    before_action :authenticate_admin!, except: [:index, :show]
    before_action :find_post, only: [:edit, :update, :show, :destroy]

    def index
      @posts = Post.most_recent
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "Successfully created post!"
        redirect_to admins_post_path(@post)
      else
        flash[:alert] = "Error creating new post!"
        render :new
      end
    end

    def edit    
    end

    def update
      if @post.update_attributes(post_params)
        flash[:notice] = "Successfully updated post!"
        redirect_to admins_post_path(@post)
      else
        flash[:alert] = "Error updating post!"
        render :edit
      end
    end

    def show
    end

    def destroy
      if @post.destroy
        flash[:notice] = "Successfully deleted post!"
        redirect_to admins_posts_path
      else
        flash[:alert] = "Error updating post!"
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :slug)
    end

    def find_post
      @post = Post.friendly.find(params[:id])
    end
  end
end