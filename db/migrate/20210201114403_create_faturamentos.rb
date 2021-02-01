class CreateFaturamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :faturamentos do |t|
      t.date :data
      t.decimal :valor
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
