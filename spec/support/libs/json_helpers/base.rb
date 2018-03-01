module JsonHelpers
  module Base
    def json
      @json = JSON.parse(response.body)
    end

    def data
      json_node('data')
    end

    def json_node(node)
      Array.wrap(json[node])
    rescue
      raise "Node #{node} not found on JSON -> #{json}"
    end
  end
end
