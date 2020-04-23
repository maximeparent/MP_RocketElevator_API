require 'open_weather'

class Streamer
    def self.add(input)
        input
    end
    def self.getcontent()
        nil
    end
    def self.getimage()
        "app/assets/images/award1.jpeg"
    end
    def self.realtimeweather()
        options = { units: "metric", APPID: '2a85b82a44affaa68c36bf2b7423be21' }
         info = OpenWeather::Current.city("Los Angeles, US", options)
         puts info
         info
    end
end