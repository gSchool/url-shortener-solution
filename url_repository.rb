require './url'

class UrlRepository
  
  def initialize(db)
    @url_table = db[:urls]
  end

  def create(url_to_shorten)
    @url_table.insert(original_url: url_to_shorten)
  end

  def find(id)
    url = @url_table.where(id: id).first
    if !url.nil?
      Url.new(id, url[:original_url], url[:visits])
    else
      nil
    end
  end

  def update(id, new_attributes)
    @url_table.where(id: id).update(new_attributes)
  end
end