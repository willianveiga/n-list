# frozen_string_literal: true

require_relative '../rails_helper'

describe 'To-Do List' do
  let(:user) { create(:user) }

  before { login_as(user) }

  context 'when creating a new to-do list' do
    before { visit('/to_do_lists/new') }

    context 'when a title is provided' do
      it 'creates a to-do-list and displays a successful message' do
        within(class: 'to-do-list') do
          fill_in(id: 'to_do_list_name', with: Faker::Lorem.sentence)
        end

        click_button('Save')

        expect(page).to(have_content('To-do list was successfully created.'))
      end
    end

    context 'when a title is not provided' do
      it 'does not create a To-Do-List and displays an error message' do
        click_button('Save')

        expect(page).to(have_content("Name can't be blank"))
      end
    end
  end

  context 'when editing an existing to-do list' do
    let(:to_do_list) { create(:to_do_list, user: user) }
    let!(:tasks) { create_list(:task, 2, to_do_list: to_do_list) }

    before { visit("/to_do_lists/#{to_do_list.id}/edit") }

    context 'when changing the title' do
      it 'updates the To-Do-List and displays a successful message' do
        within(class: 'to-do-list') do
          fill_in(id: 'to_do_list_name', with: Faker::Lorem.sentence)
        end

        click_button('Save')

        expect(page).to(have_content('To-do list was successfully updated.'))
      end
    end

    context 'when adding a new task' do
      it 'creates a new task and displays a successful message' do
        click_link('New task')
        all('.task__input').last.fill_in(with: Faker::Lorem.sentence)

        click_button('Save')

        expect(page).to(have_content('To-do list was successfully updated.'))
      end
    end

    context 'when removing an task' do
      it 'removes the task and displays a successful message' do
        find(:css, "[title='Remove task']", match: :first).click

        click_button('Save')

        expect(page).to(have_content('To-do list was successfully updated.'))
      end
    end

    context 'when sorting tasks' do
      let!(:tasks) { create_list(:task, 3, to_do_list: to_do_list) }

      it 'keeps the sorted tasks on the right position and displays a successful message' do
        first_task = all('.task').first
        last_task = all('.task').last
        first_task_value = first_task.find('.task__input').value

        first_task.find('.task__drag-icon').drag_to(last_task)

        click_button('Save')

        last_task_value = all('.task').last.find('.task__input').value
        expect(last_task_value).to eq(first_task_value)
      end
    end

    context 'when erasing the title' do
      it 'does not update the to-do list and displays an error message' do
        within(class: 'to-do-list') do
          fill_in(id: 'to_do_list_name', with: nil)
        end

        click_button('Save')

        expect(page).to(have_content("Name can't be blank"))
      end
    end
  end

  context 'when to-do list does not belong to the current user' do
    let(:to_do_list) { create(:to_do_list, user: create(:user)) }

    before { visit("/to_do_lists/#{to_do_list.id}/edit") }

    it 'redirects the user to an unauthorized error page' do
      expect(page).to(have_content('You may not have authorization to access this resource.'))
    end
  end

  context 'when deleting a to-do list' do
    let(:to_do_list) { create(:to_do_list, user: user) }
    let!(:task) { create(:task, to_do_list: to_do_list) }

    before { visit('/') }

    it 'removes the to-do list' do
      accept_confirm do
        find(:css, "[title='Remove to-do list']", match: :first).click
      end

      expect(page).to(have_content('To-do list was successfully destroyed.'))
    end
  end

  context 'when cloning a to-do list' do
    let(:to_do_list) { create(:to_do_list, user: user) }
    let!(:task) { create(:task, to_do_list: to_do_list) }

    before { visit('/') }

    it 'opens the cloned to-do-list for editing' do
      find(:css, "[title='Clone to-do list']", match: :first).click

      expect(find('#to_do_list_name').value).to(eq("#{to_do_list.name} (CLONE)"))
    end
  end

  context 'when listing to-do lists' do
    before { visit('/') }

    context 'when there are no to-do lists' do
      it 'displays a message' do
        expect(page).to(have_content('There are no to-do lists yet.'))
      end
    end
  end
end
