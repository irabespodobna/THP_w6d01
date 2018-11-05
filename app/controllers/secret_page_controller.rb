class SecretPageController < ApplicationController

before_action :require_login

 def show
 end

 private

     def require_login
     unless logged_in?
       flash[:info] = "You must be logged in to access this section"
       redirect_to '/login' # halts request cycle
     end
    end
end

