require 'net/http'
require 'json'
class AlarmsController < ApplicationController  

  def index
  end

  def about
  end

  # def settings
  # end

  def fire_alarm
    # get data at 'http://192.168.0.2/sensor/all';  
 
    uri = URI.parse("http://192.168.0.2/sensor/all")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    if response.code == "200"
      result = JSON.parse(response.body)
      if result["lastSensorReading"]["outside_light_sensor1"] < 100
        #puts "YO"
        #we play with the lights
        uri2 = URI.parse('http://192.168.0.4/api/newdeveloper/lights/1/state')
        http2 = Net::HTTP.new(uri2.host, uri2.port)
        request2 = Net::HTTP::Put.new(uri2.request_uri)
        request2.body = {"effect" => "colorloop", "on" => true}.to_json
        response2 = http2.request(request2)
        puts response2.body

      end
      if result["lastSensorReading"]["outside_light_sensor1"] >= 100
        #make the request to invert the window
        uri2 = URI.parse("http://192.168.0.2/actions/override?timeout_seconds=120&api_key=AEChackathon")
        http2 = Net::HTTP.new(uri2.host, uri2.port)
        request2 = Net::HTTP::Get.new(uri2.request_uri)
        response2 = http2.request(request2)
      end
    end
    render :json => {:success => true}
  end

  

end

__END__

