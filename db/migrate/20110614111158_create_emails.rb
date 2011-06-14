class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.text :message
      t.text :plain
      t.text :html
      t.text :from
      t.text :to
      t.text :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
