class CreateMessageSents < ActiveRecord::Migration[7.0]
  def change
    create_table :message_sents do |t|

      t.timestamps
    end
  end
end
