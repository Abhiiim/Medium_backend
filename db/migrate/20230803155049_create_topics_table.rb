class CreateTopicsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :topics_tables do |t|
      t.string :topic_name
      t.timestamps
    end
    # delete_column :posts, :topic
  end
end