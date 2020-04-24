class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, default: "", nil: false
      t.string :password_digest
      t.string :name, default: "", nil: false
      t.string :is_admin, default: false, nil: false
      t.string :is_article_editor, default: false, nil: false
      t.string :is_volunteer, default: false, nil: false

      t.timestamps
    end
  end
end
