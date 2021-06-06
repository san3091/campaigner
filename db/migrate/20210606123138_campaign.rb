class Campaign < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign do |t|
      t.string :name
      t.text :description
    end
  end
end
