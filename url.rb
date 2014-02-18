class Url
  attr_accessor :original_url, :visits

  def initialize(original_url, visits)
    @original_url = original_url
    @visits = visits
  end

end