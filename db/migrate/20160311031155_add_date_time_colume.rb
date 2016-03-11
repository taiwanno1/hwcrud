class AddDateTimeColume < ActiveRecord::Migration
  def change
    add_column :books, :publication_date, :datetime
    add_column :books, :date_added, :datetime
  end
end
