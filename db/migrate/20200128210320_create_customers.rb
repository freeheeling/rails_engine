class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'
    
    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
