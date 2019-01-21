class CreateSympathies < ActiveRecord::Migration[5.2]
  def change
    create_table :sympathies do |t|
      t.references :post, foreign_key: true
      t.integer :count, null: false

      t.timestamps
    end
  end
end
