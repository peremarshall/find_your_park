class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string     :uuid
      t.string     :name
      t.text       :description
      t.timestamps
    end
  end
end
