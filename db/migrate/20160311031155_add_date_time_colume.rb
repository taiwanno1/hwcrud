class AddDateTimeColume < ActiveRecord::Migration
  def change
    add_column :books, :publication_date, :string
    add_column :books, :date_added, :string
  end
end
