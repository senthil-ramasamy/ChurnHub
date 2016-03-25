class CreateProbs < ActiveRecord::Migration
  def change
    create_table :probs do |t|
      t.string :pname
      t.text :pstatement
      t.integer :pid
      t.date :pdate
      t.string :person
      t.integer :votes
      t.integer :rateing
      t.integer :points
      t.string :tag
      t.string :probstatus
      t.integer :emp
      t.integer :sym

      t.timestamps null: false
    end
  end
end
