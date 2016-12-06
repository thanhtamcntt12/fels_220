class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :avatar
      t.boolean :is_admin, default: 0

      t.timestamps
    end
  end
end
