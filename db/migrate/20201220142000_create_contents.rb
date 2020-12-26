class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :status
      t.string :links

      t.timestamps
    end
  end
end
