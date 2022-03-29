class DropMessageSents < ActiveRecord::Migration[7.0]
  def change
    drop_table :message_sents
  end
end
