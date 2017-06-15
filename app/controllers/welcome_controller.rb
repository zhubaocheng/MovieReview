class WelcomeController < ApplicationController
  def index
    flash[:notice] ="欢迎来影评！！！"
  end
end
