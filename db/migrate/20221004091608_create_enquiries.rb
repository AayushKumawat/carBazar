class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.string :content
      t.string :contact_no
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
