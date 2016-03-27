class CreateRetentions < ActiveRecord::Migration
  def change
    create_table :retentions do |t|
      t.integer :retid
      t.references :trainmodel, index: true, foreign_key: true
      t.string :offer1
      t.string :offer2
      t.string :offer3
      t.text :range
      t.boolean :modcheck

      t.timestamps null: false
    end
  end
end
