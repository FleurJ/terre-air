class CreateContentTags < ActiveRecord::Migration[6.0]
  def change
    create_table :content_tags do |t|
      t.references :tags, null: false, foreign_key: true
      t.references :contents, null: false, foreign_key: true

      t.timestamps
    end
  end
end
