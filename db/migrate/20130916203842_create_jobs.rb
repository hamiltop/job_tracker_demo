class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
