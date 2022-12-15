class Marketplace < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def self.search(search)
    if search
      find_markets = Item.find_by(category: search)
      if find_markets
          self.where(item_id: find_markets.id)
      else 
        Item.all
      end
    else
      Item.all
    end
  end

end
