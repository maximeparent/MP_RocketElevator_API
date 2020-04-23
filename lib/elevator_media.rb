require 'open_weather'
# module elevator_media

    class Streamer
        def self.add(input)
            input
        end
    # ---------Test get content--------------
        
        def self.getcontent()
            options = { units: "metric", APPID: '2a85b82a44affaa68c36bf2b7423be21' }
            info = OpenWeather::Current.city("Los Angeles, US", options)
            puts info
            info
        end
    # ---------Test Get an image-------------
        def self.getimage()
            "app/assets/images/award1.jpeg"
        end
    # ---------Test get something --------------
        def self.getsomething()
            return "Hello World"
        end
    end


    