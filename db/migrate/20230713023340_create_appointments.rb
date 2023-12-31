class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :physical_therapist_id
      t.string :case 
      t.boolean :home_visit
      t.boolean :telemedicine
      t.string :scheduled
      t.timestamps
    end
  end
end
