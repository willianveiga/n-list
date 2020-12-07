# frozen_string_literal: true

require_relative '../rails_helper'

describe ToDoListsController do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:to_do_list) { create(:to_do_list, user: another_user) }

  before { sign_in(user) }

  describe 'PATCH /update' do
    context 'when current user is not the to-do list owner' do
      it 'displays an unauthorized error page' do
        patch(:update, params: { id: to_do_list.id, name: Faker::Lorem.sentence })

        expect(response).to(have_http_status(:unauthorized))
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when current user is not the to-do list owner' do
      it 'displays an unauthorized error page' do
        delete(:destroy, params: { id: to_do_list.id })

        expect(response).to(have_http_status(:unauthorized))
      end
    end
  end

  describe 'POST /clone' do
    context 'when current user is not the to-do list owner' do
      it 'displays an unauthorized error page' do
        post(:clone, params: { id: to_do_list.id })

        expect(response).to(have_http_status(:unauthorized))
      end
    end
  end
end
