class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :tips_type
      t.string :country
      t.string :tips_content
      t.string :street_view
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
