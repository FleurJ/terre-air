class TagsController < ApplicationController
  before_action :find_tag, only: [:update, :edit, :destroy]
  before_action :authorised_user

  def index
    @tags = Tag.all.sort_by(&:title)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to tags_path
  end

  def edit
  end

  def update
    @tag.update!(tag_params)
    redirect_to tags_path
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title, :description)
  end

  def authorised_user
    return true if current_user.admin == true
  end
end
