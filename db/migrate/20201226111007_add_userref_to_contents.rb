class AddUserrefToContents < ActiveRecord::Migration[6.0]
  def change
    add_reference :contents, :user, null: false, foreign_key: true
  end
end
