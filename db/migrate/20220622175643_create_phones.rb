class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :make
      t.string :model
      t.string :serial

      t.timestamps
    end
  end
end
