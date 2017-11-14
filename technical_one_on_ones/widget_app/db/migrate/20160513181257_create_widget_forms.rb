class CreateWidgetForms < ActiveRecord::Migration
  def change
    create_table :widget_forms do |t|

      t.timestamps null: false
    end
  end
end
