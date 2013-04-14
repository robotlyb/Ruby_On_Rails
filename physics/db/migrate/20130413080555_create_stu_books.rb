class CreateStuBooks < ActiveRecord::Migration
  def change
    create_table :stu_books do |t|
      t.integer :user_id
      t.integer :experiment_id
      t.string :day
      t.timestamp :date

      t.timestamps
    end
  end
end
