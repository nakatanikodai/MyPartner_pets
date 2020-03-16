class AddPartnerToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :partner, :string
  end
end
