class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :cas_id
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
