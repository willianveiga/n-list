# frozen_string_literal: true

class LoginController < ApplicationController
  before_action :redirect_if_already_signed_in

  private

  def redirect_if_already_signed_in
    redirect_to(to_do_lists_path) if user_signed_in?
  end
end
