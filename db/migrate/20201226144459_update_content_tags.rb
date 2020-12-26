class UpdateContentTags < ActiveRecord::Migration[6.0]
  def change
    rename_column :content_tags, :contents_id, :content_id
  end
end
