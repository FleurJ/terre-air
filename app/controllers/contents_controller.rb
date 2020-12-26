require 'pry-byebug'
class ContentsController < ApplicationController
  before_action :find_content, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_tags, only: [:new, :edit]

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user = current_user
    @content.save
    redirect_to content_path(@content)
  end

  def edit
  end

  def update
    @content.update!(content_params)
    redirect_to content_path(@content)
  end

  def destroy
    @content.destroy
    redirect_to root_path
  end

  def index
    @contents = Content.all
  end

  private

  def content_params
    params.require(:content).permit(:title, :status, :teaser, :body, :links, :img_header, :img_thumbnail, tags_id: [])
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_content
    @content = Content.find(params[:id])
  end

  def find_tags
    @tags = Tag.all
  end
end
