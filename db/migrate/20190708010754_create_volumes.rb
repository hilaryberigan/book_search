class CreateVolumes < ActiveRecord::Migration[5.2]
  def change
    create_table :volumes do |t|

      t.timestamps
    end
  end
end
