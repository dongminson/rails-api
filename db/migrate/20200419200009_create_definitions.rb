class CreateDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :definitions do |t|
      t.references :word, null: false, foreign_key: true
      t.string :partOfSpeech
      t.string :definition

      t.timestamps
    end
  end
end
