class MoviesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :find_movie_and_check_permission, only: [:eit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.order("created_at DESC")
  end

  def edit
    find_movie_and_check_permission
  end

  def update

    find_movie_and_check_permission

    if @movie.update(movie_params)
      redirect_to movies_path
      flash[:notice] = "你真牛！电影编辑成功！！！"
    else
      render :edit
    end
  end

  def destroy

    find_movie_and_check_permission

    @movie.destroy
    redirect_to movies_path
    flash[:alert] = "电影已被成功删除！！！"
  end

  private

  def find_movie_and_check_permission
    @movie = Movie.find(params[:id])

    if current_user != @movie.user
      redirect_to movies_path
      flash[:notice] = "抱歉啦，你没有这个操作权限！！！"
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
