class SearchesController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]

    @game = PostImage.search(@range, search,word)
  end
end