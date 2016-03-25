class CreateSolns < ActiveRecord::Migration
  def change
    create_table :solns do |t|
      t.string :solnname
      t.text :solntext
      t.string :solnauthor, :default => "Senthil"
      t.integer :solnid
      t.date :solndate
      t.references :prob, index: true, foreign_key: true
      t.integer :solnvotes
      t.integer :solnrating

      t.timestamps null: false
    end
  end
end
