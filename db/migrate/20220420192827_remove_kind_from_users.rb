class RemoveKindFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :kind, :integer
  end
end
