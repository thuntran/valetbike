module DeviseHelper
  
    # Overrides standard helper to function like other site alerts
    def devise_error_messages!
        if resource.errors.present?
            flash.now[:alert] ||= ""
            resource.errors.full_messages.each do |message|
                flash.now[:alert] << message + ". "
            end
        end
    end
      
  end

#this code is from https://github.com/AnyKeyOrg/anykey and will hopefully help display wrong password errors etc
# also used solutions from https://github.com/heartcombo/devise/issues/5446