class Store < ActiveRecord::Base
  has_many :members
  
  # limitation of 100 elements per query, which means 99 members at a time  
  # the url length max is 2048, so going with 50 members at a time
  def compute_member_distance_from_store    
    members_needing_computation = members.select{ |m| m.distance_from_store == 0 }
    
    while ((mems = members_needing_computation.slice!(0, 50)).length > 0)
      query = "destinations=#{lat},#{lng}&origins="
      mems.each do |m|       
          query << "#{m.lat},#{m.lng}|"
      end
    
      base_url = "http://maps.googleapis.com/maps/api/distancematrix/json?mode=driving&sensor=false"
      url = "#{base_url}&#{URI.encode(query)}"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body

      result = ActiveSupport::JSON.decode(data)
      puts "#{result} - #{mems.length} - #{members_needing_computation.length}"
      if ( result['status'] == "OK" )
        result['rows'].each_with_index do |r, i|
          if ( r['elements'][0]['status'] == "OK" )
            mems[i].distance_from_store = r['elements'][0]['distance']['text'].gsub(/[a-z ]/,'')
            mems[i].save
          end
        end
      else
        puts result['status']
      end
    end
  end
end
