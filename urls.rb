class Urls
  @urls = {}
  def self.create(url_to_shorten)
    max_id = @urls.keys.max.nil? ? 0 : @urls.keys.max
    new_id = max_id + 1
    @urls[new_id] = {original_url: url_to_shorten, visits: 0}
    new_id
  end

  def self.find(id)
    @urls[id]
  end

  def self.update(id, new_attributes)
    url = find(id)
    url.merge!(new_attributes)
  end
end