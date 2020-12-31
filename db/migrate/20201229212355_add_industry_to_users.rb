class AddIndustryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :industry_id,     :integer
    add_column :users, :occupation_id,   :integer
    add_column :users, :position_id,     :integer
    add_column :users, :introduction,    :text
  end
end
