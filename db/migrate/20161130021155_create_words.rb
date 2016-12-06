class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :word_detail
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
