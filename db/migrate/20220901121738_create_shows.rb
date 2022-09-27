# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[7.0]
  def up
    enable_extension "uuid-ossp" unless extension_enabled?("uuid-ossp")

    create_table :shows do |t|
      t.uuid :identifier, null: false, default: "uuid_generate_v4()"
      t.string :name, null: false

      t.timestamps
    end
    add_index :shows, :name

    create_table :episodes do |t|
      t.references :show, null: false, foreign_key: true, index: false
      t.uuid :identifier, null: false, default: "uuid_generate_v4()"
      t.string :name, null: false
      t.string :season, null: true

      t.timestamps
    end

    create_table :resources do |t|
      t.references :episode, null: false, foreign_key: true, index: false
      t.uuid :identifier, null: false, default: "uuid_generate_v4()"
      t.string :path, null: false

      t.timestamps
    end
  end

  def self.down
    disable_extension "uuid-ossp"
  end
end
