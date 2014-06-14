class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :kind
      t.text :description
      t.references :service, index: true

      t.timestamps
    end
  end
end
