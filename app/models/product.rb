class Product < ActiveRecord::Base
  has_many :reviews

  after_create :load_feedbacks

  # good idea is to call this method in background job but it is definitelly too much for this test app
  def load_feedbacks
    feedbacks = Walmart.get_feedbacks_for self.name

    feedbacks.each do |f|
      self.reviews.create! :text => f
    end
  end
end