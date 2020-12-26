class ContentsController < ApplicationController
  before_action :find_content, only: [:update, :edit, :destroy]
  before_action :authorised_user, only: [:new, :create, :update, :edit, :destroy]

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
    @tags = Tag.all
  end

  def create
    @content = Content.new(content_params)
    @content.save
    redirect_to content_path(@content)
  end

  def edit
    @tags = Tag.all
  end

  def update
    @content.update(content_params)
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
    params.require(:content).permit(:title, :status, :teaser, :body, :links, :img_header, :img_thumbnail, tag_ids: [])
  end

  def authorised_user
    return true if current_user.admin == true
  end

  def find_content
    @content = Content.find(params[:id])
  end
end
