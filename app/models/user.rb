# frozen_string_literal: true

class User < ApplicationRecord
  has_many :to_do_lists

  devise :omniauthable, omniauth_providers: %i[google_oauth2]
end
