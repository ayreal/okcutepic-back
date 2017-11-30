class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :match_id
      t.boolean :mutual, :default => false
      t.timestamps
    end
  end
end
