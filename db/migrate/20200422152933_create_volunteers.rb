class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :image_url
      t.string :name
      t.text :job_desc

      t.timestamps
    end
  end
end
