class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.text    :bio
      t.integer :age
      t.string  :location
      t.string  :facepic
      t.string  :altpic
      t.integer :gender
      t.integer :gender_choice
      t.timestamps
    end
  end
end
