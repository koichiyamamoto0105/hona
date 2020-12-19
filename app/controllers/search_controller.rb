class SearchController < ApplicationController

  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@model = 'map'
    @records = Map.search_for(@content, @method)
		# if @model == 'map'
		# 	@records = Map.search_for(@content, @method)
		# # else
		# 	@records = User.search_for(@content, @method)
		# end
  end
end
