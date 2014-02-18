class Url
  attr_accessor :original_url, :visits
  attr_reader :id

  def initialize(id, original_url, visits)
    @id = id
    @original_url = original_url
    @visits = visits
  end

end