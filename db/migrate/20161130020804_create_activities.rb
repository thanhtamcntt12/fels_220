class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :target
      t.string :target
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
