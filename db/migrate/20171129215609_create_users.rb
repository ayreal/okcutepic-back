class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.text    :bio
      t.integer :age
      t.string  :location
      t.string  :photo
      t.integer :avatar
      t.integer :gender
      t.integer :gender_choice
      t.string  :password_digest
      t.timestamps
    end
  end
end
