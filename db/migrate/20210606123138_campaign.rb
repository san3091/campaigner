class Campaign < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
