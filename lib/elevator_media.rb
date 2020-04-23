require 'open_weather'
require 'vimeo_me2'

class Streamer
    def self.add(input)
        input
    end
# ---------Test get content--------------
    def self.getcontent()
        return "Hello World"
    end
# ---------Test Get an image-------------
    def self.getimage()
        "app/assets/images/award1.jpeg"
    end
# ---------Test API open_weather--------------
    def self.realtimeweather()
        options = { units: "metric", APPID: '2a85b82a44affaa68c36bf2b7423be21' }
         info = OpenWeather::Current.city("Los Angeles, US", options)
         puts info
         info
    end
    def self.vimeovideo()
        vimeo = VimeoMe2::VimeoObject.new('62dfd91a421a3eb8d7225e58ac471361') #  must be replace by a valid token
    end
end
