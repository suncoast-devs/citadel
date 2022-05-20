class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.timestamp :accepted_at

      t.timestamps
    end
  end
end
