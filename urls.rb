require './url'

class Urls
  @urls = DB[:urls]

  def self.create(url_to_shorten)
    @urls.insert(original_url: url_to_shorten)
  end

  def self.find(id)
    url = @urls.where(id: id).first
    if !url.nil?
      Url.new(id, url[:original_url], url[:visits])
    else
      nil
    end
  end

  def self.update(id, new_attributes)
    @urls.where(id: id).update(new_attributes)
  end
end