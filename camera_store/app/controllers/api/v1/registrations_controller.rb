class  Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :permit_all_params
  def create
    # debugger
    user = User.new(sign_up_params)
    if user.save

      create_cart(user.id)
      token = JWT.encode({user_id: User.find_by(email: sign_up_params['email']).id}, 's3cr3t')
      UserMailer.user_confirmation(user).deliver
      puts token
      puts user.id
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end


  def create_cart(id)
    @cart = Cart.create(user_id: id)
  end

  private
  def sign_up_params
    params.except('controller', 'action')
  end

  def permit_all_params
    params.permit!
  end  

end	