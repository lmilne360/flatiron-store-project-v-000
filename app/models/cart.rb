class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items, dependent: :delete_all
	has_many :items, through: :line_items
	validates_presence_of :user_id

	  def total
	    total = 0
	    self.line_items.each do |line_item|
	      total += line_item.item.price * line_item.quantity
	    end
	    total.to_f/100
	  end

	def checkout
		self.line_items.each do |li|
			li.item.inventory -= li.quantity
			li.item.save
		end
		line_items.clear
		self.status = "Submitted"
	end

	def add_item(item_id)
		line_item = self.line_items.find_by(item_id: item_id.to_i)
		if line_item 
			line_item.quantity += 1
			line_item.save
		else
			line_item = self.line_items.create!(item_id: item_id.to_i, quantity: 1)
		end
		line_item
	end

end


