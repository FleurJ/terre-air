class RemoveUserrefFromContents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :contents, :users, null: false, foreign_key: true
  end
end
