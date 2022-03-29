class UserToMessageSents < ActiveRecord::Migration[7.0]
  def change
    add_reference :message_sents, :user, foreign_key: true
  end
end
