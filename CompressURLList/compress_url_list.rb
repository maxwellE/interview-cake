class CompressURLList

  def initialize
    @visited = {}
  end

  def visit_url(url)
    host = URI::parse(url).host
    return if @visited[host]
    @visited[host] = true
  end
end