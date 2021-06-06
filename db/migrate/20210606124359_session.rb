class Session < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :number, null: false
      t.string :title, default: 'Untitled'
      t.belongs_to :campaign, foreign_key: true

      t.timestamps
    end
  end
end
