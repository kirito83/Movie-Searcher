class HomeController < ApplicationController
  def index
  end

  def search
      if !(params[:search].blank?)
          @results = MovieSearch.new(params[:search])
          #@params[:results] = 
          @movies=@results.search
      else
        flash.now[:danger]="Si un film sans titre existait ça se saurait :/"
      end
  end
end
