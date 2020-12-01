# frozen_string_literal: true

class ToDoList < ApplicationRecord
  CLONE_NAME_FORMAT = '%s (CLONE)'
  private_constant :CLONE_NAME_FORMAT

  belongs_to :user
  has_many :tasks, -> { order(:position) }, dependent: :delete_all

  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :name, presence: true

  def clone_with_tasks
    attributes = dup.attributes.merge(
      'name' => format(CLONE_NAME_FORMAT, name),
      'tasks' => tasks.map(&:dup)
    )
    self.class.new(attributes)
  end
end
