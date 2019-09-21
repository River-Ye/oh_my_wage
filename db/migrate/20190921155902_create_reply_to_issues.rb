class CreateReplyToIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_to_issues do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
