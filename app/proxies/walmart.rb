require "walmart_open"

class Walmart
  def self.get_feedbacks_for item_id
    uri = URI("http://api.walmartlabs.com/v1/reviews/#{item_id}?apiKey=#{Rails.application.secrets.walmart_key}&format=json")

    req = Net::HTTP::Get.new(uri)
    
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request req
    end

    parsed_response = JSON.parse(res.body)    

    parsed_response["reviews"].map do |r|
      r["reviewText"]
    end
  end
end