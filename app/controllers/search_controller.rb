class SearchController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'map'
      @records = Map.search_for(@content, @method)
    else
      @records = Hashtag.search_for(@content, @method)
    end
  end
end
