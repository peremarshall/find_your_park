class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string     :searchable_type
      t.string     :criteria
      t.timestamps
    end
  end
end
