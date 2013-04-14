class CreateExtBookeds < ActiveRecord::Migration
  def change
    create_table :ext_bookeds do |t|
      t.integer :experiment_id
      t.string :day
      t.integer :rest

      t.timestamps
    end
  end
end
