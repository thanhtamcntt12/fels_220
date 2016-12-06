class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_correct
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
