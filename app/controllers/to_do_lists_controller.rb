# frozen_string_literal: true

class ToDoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_to_do_list, except: %i[index new create]
  before_action :render_unauthorized, except: %i[index new create], unless: :current_user_has_permissions?

  def index
    @to_do_lists = current_user.to_do_lists.order(:name)
  end

  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    @to_do_list.user = current_user
    if @to_do_list.save
      redirect_to(edit_to_do_list_path(@to_do_list), notice: 'To-do list was successfully created.')
    else
      render(:new)
    end
  end

  def update
    if @to_do_list.update(to_do_list_params)
      redirect_to(edit_to_do_list_path(@to_do_list), notice: 'To-do list was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @to_do_list.destroy
    redirect_to(to_do_lists_url, notice: 'To-do list was successfully destroyed.')
  end

  def clone
    to_do_list_clone = @to_do_list.clone_with_tasks
    to_do_list_clone.save
    redirect_to(edit_to_do_list_path(to_do_list_clone))
  end

  private

  def set_to_do_list
    @to_do_list = ToDoList.find(params[:id])
  end

  def render_unauthorized
    render(file: 'public/401.html', layout: false, status: :unauthorized)
  end

  def current_user_has_permissions?
    @to_do_list.user == current_user
  end

  def to_do_list_params
    params.require(:to_do_list).permit(:name, tasks_attributes: %i[id content done position _destroy])
  end
end
