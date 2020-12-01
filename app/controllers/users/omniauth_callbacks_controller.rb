# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      email = email_param
      redirect_to(root_path, alert: 'E-mail not provided by Google. Try again later.') unless email.present?

      user = User.find_or_create_by(email: email)
      sign_in_and_redirect(user, event: :authentication)
    end

    private

    def email_param
      request.env.dig('omniauth.auth', :info, :email)
    end
  end
end
