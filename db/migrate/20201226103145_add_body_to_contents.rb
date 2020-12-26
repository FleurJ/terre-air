class AddBodyToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :teaser, :text
    add_column :contents, :body, :text
  end
end
