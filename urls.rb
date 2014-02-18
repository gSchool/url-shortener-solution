require './url'

class Urls
  @urls = {}
  def self.create(url_to_shorten)
    max_id = @urls.keys.max.nil? ? 0 : @urls.keys.max
    new_id = max_id + 1
    @urls[new_id] = Url.new(new_id, url_to_shorten, 0)
    new_id
  end

  def self.find(id)
    @urls[id]
  end

  def self.update(id, new_attributes)
    url = find(id)
    new_attributes.each do |attribute, value|
      url.send("#{attribute}=", value)
    end
  end
end