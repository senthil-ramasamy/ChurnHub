class CreateVprobs < ActiveRecord::Migration
  def change
    create_table :vprobs do |t|
      t.string :pvname
      t.text :pversion
      t.string :pvauthor, :default => "Doe"
      t.integer :pvid
      t.date :pvdate
      t.integer :pvinteger
      t.references :prob, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
