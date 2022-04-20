class RemoveBirthDateFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :birth_date, :string
  end
end
