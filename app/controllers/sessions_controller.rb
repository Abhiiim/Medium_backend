class SessionsController < ApplicationController
    before_action :authenticate_user, except: [:create]
    
    def create
        @user = User.find_by(email: params[:email])
    
        if @user&.authenticate(params[:password])
          token = generate_token(@user.id)
          render json: { user: @user, token: token }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    
      private
    
      def generate_token(user_id)
        payload = { user_id: user_id, exp: 24.hours.from_now.to_i }
        secret_key = Rails.application.credentials.secret_key_base
        JWT.encode(payload, secret_key)
      end
end
