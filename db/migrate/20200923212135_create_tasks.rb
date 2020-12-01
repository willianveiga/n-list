# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :done
      t.integer :position
      t.references :to_do_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
