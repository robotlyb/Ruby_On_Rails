class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :ext_name
      t.integer :order_id

      t.timestamps
    end
  end
end
