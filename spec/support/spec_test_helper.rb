module SpecTestHelper
    def login_admin
        user = FactoryGirl.create(:user, type: 0)
        session[:user_id] = user.id
    end

    def login(userid)
        redirect_to ingredient_path
        user = User.find(userid)
        if user
            request.session[:user_id] = user.id
        end
        redirect_to ingredient_path
    end

    def logout
        request.session[:user_id] = nil
    end

    def current_user
        User.find(request.session[:user_id])
    end
end
  
RSpec.configure do |config|
    config.include SpecTestHelper, type: :controller
end