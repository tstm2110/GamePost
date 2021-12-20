class SearchesController < ApplicationController

  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]

    if @range == '1'
      @game = PostImage.search(search,word)
    else
      @tag = Tag.search(search,word)
    end
  end
end