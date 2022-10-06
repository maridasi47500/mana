class NewsController < ApplicationController
protect_from_forgery except: [:postcomment]
  def index
    @news=News.all.limitnb(params[:page])
  end

  def show
    @news=News.find_by_url(params[:title])
  end
    def postcomment
    @comment=Comment.new(comment_params)
    if !@comment.valid? && @comment.errors.messages[:email]
    p @comment
    p @comment.errors
    render :emailunvalid,layout: false
    elsif params[:mytype] == "press_release"
    @press_release=PressRelease.find(params[:comment_post_ID])

    @comment.save
    @press_release.comments << @comment
    redirect_to press_release_path(title: @press_release.url)
    else
    @news=News.find(params[:comment_post_ID])

    @comment.save
    @news.comments << @comment
    redirect_to news_path(title: @news.url)
    end
    end
    private
    def comment_params
    params.permit(:comment,:comment_post_ID,:email,:message,:author,:comment_parent)
    end
end
