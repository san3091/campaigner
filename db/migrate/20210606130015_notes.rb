class Notes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :note_type
      t.text :text
      t.belongs_to :session, foreign_key: true

      t.timestamps
    end
  end
end
