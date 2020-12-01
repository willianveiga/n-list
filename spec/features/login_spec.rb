# frozen_string_literal: true

require_relative '../rails_helper'

describe 'Login', type: :feature do
  context 'when user does not exist' do
    before { visit('/') }

    context 'when signing in' do
      before do
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          'info' => { 'email' => Faker::Internet.email }
        )
      end

      it 'creates an user and sign him in' do
        find(:css, '.login__button', match: :first).click

        expect(page).to(have_content('There are no to-do lists yet.'))
      end
    end
  end

  context 'when user exists' do
    let(:user) { create(:user) }

    before { visit('/') }

    context 'when signing in' do
      before do
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          'info' => { 'email' => user.email }
        )
      end

      it 'creates an user and sign him in' do
        find(:css, '.login__button', match: :first).click

        expect(page).to(have_content('There are no to-do lists yet.'))
      end
    end
  end

  context 'when user is already signed in' do
    let(:user) { create(:user) }

    before do
      login_as(user)
      visit('/')
    end

    it 'redirects to the to-do lists listing' do
      expect(page).to(have_content('There are no to-do lists yet.'))
    end
  end
end
