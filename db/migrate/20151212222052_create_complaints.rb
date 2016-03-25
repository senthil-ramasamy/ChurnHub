class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :cid
      t.text :ctext
      t.string :cfield
      t.integer :cactionseq
      t.boolean :ifprivate
      t.text :cpersonal

      t.timestamps null: false
    end
  end
end
