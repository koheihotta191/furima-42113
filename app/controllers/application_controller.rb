class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def message_params
    permitted_attributes = [:user, :name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price]
    params.require(:item).permit(*permitted_attributes).merge(user_id: current_user.id)
  end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end



  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
