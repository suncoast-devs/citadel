class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :profile, null: false, foreign_key: true
      t.integer :status, default: 0
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
