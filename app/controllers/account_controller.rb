class AccountController < ApplicationController
    before_action :authenticate_user!, except: [ :index ]
    
    def index
        @articles = Article.order(id: :desc).limit(10)
    end

    def profile
        @profile = User.find_by_username params[:username]
        @articles = @profile.articles.order(id: :desc)
    end
    
end