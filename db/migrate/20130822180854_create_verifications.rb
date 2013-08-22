class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.string :phone
      t.integer :code

      t.timestamps
    end
  end
end
