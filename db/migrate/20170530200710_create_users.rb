class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, default: ""
      t.string :email, null: false, default: ""
    end
  end
end
