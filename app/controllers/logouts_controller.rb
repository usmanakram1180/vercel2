class LogoutsController < ApplicationController
    def index
        @user = current_user
        # Additional logic as needed
      end
end
