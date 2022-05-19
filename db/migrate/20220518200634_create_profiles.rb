class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :given_name
      t.string :family_name
      t.string :email_address
      t.string :nickname
      t.string :address_street
      t.string :address_additional
      t.string :address_locality
      t.string :address_region
      t.string :address_country, default: 'us'
      t.string :address_postal_code
      t.string :phone_number
      t.string :emergency_contact_name
      t.string :emergency_contact_phone_number
      t.string :pronouns
      t.string :shirt_size
      t.string :medical_note

      t.timestamps
    end
  end
end
