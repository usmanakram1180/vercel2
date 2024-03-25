# app/controllers/timelines_controller.rb
class TimelinesController < ApplicationController
    def index
        @homes = Home.all
      @user = current_user  
      # Other logic here
    end
  end
  