class AddContentAuthorToQuote < ActiveRecord::Migration[5.0]
  def change
    change_table :quotes do |t|
    t.string :content, :author 
  end
  end
end
