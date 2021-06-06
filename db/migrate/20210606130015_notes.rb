class Notes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :type, null: false
      t.text :text

      t.timestamps
    end
  end
end
