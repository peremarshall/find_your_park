module NationalParkService

  class Park
    attr_accessor :name, :description, :uuid

    def initialize(json)
      @uuid        = json["id"]
      @name        = json["name"]
      @description = json["description"]
      @latitude    = parse_latitude(json["latLong"])
      @longitude   = parse_longitude(json["latLong"])
    end

    def parse_latitude(lat_long)
      match = /lat:([0-9\-.]*),/.match(lat_long)
      return match[1] if match
    end

    def parse_longitude(lat_long)
      match = /long:([0-9\-.]*)$/.match(lat_long)
      return match[1] if match
    end
  end
end
