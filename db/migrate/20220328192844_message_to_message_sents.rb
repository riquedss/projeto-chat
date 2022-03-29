class MessageToMessageSents < ActiveRecord::Migration[7.0]
  def change
    add_reference :message_sents, :message, foreign_key: true
  end
end
