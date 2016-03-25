class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :chaltext
      t.string :chalname
      t.date :chaldate
      t.integer :chalprize
      t.string :chalsponsor, :default => "NitHackathon"

      t.timestamps null: false
    end
  end
end
