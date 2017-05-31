module RequestHelper
  def json
    JSON.parse(response.body) if response.body
  end
end
