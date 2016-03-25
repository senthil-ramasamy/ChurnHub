class CreateTestmodels < ActiveRecord::Migration
  def change
    create_table :testmodels do |t|
      t.integer :modid
      t.text :moddesc
      t.string :modname
      t.string :trainfile
      t.string :testfile
      t.text :addtnl
      t.boolean :modcheck
      t.references :trainmodel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
