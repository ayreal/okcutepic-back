class CreateAuthControllers < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_controllers do |t|

      t.timestamps
    end
  end
end
