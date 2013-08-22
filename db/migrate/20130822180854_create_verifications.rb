class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.string :phone
      t.string :code

      t.timestamps
    end
  end
end
