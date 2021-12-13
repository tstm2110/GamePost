class HomeController < ApplicationController
  def top
  end
  
  def index
    render plain: "hello world."
  end
end