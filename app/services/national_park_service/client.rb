module NationalParkService

  class Client  
    def initialize(api_key:)
      @api_key  = api_key
      @base_url = "https://developer.nps.gov/api/v1/"
    end

    def retrieve_parks(search_term: nil, limit: 1000)
      endpoint  = @base_url + "parks"
      endpoint << "?api_key=" + @api_key
      endpoint << "&q="       + search_term if search_term
      endpoint << "&limit="   + limit.to_s if limit
      http = Curl.get(endpoint)
      parse_parks(http.body_str)
    end

    def parse_parks(results)
      parks      = []
      parks_json = JSON.parse(results)
      parks_json["data"].each do |park_json|
        parks << NationalParkService::Park.new(park_json)
      end
      return parks
    end
  end
end
