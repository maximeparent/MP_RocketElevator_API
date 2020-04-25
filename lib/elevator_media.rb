require 'open_weather'
require 'http'
require 'json'
require 'mysql2'
# module elevator_media

    class Streamer
        def self.add(input)
            input
        end
# ---------Test in database Count employees, elevator, building----------------------
        def self.getsomethingindb
            client = Mysql2::Client.new(:host => "codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com", :username => "codeboxx", :password => "Codeboxx1!", :database => "MaximeParent")
                results_employees = client.query("
                    SELECT * FROM employees
                    ")
                results_elevators = client.query("
                    SELECT * FROM elevators
                    ")
                results_buildings = client.query("
                    SELECT * FROM buildings
                    ")
                    #number of employess, elevators and building
            return " #{results_employees.count} #{results_elevators.count}  #{results_buildings.count}"
        end


# ---------Test get uselessfacts -----------------
        def self.getuselessfacts
            uselessfact = HTTP.get("https://uselessfacts.jsph.pl/random.json?language=en")
            obj = JSON.parse(uselessfact)['text']
            html = " #{obj} "
            puts html
            return html
        end

# ---------Test get weather ----------------------
        def self.getweather()
            options = { units: "metric", APPID: '2a85b82a44affaa68c36bf2b7423be21' }
            info = OpenWeather::Current.city("Los Angeles, US", options)
            puts info
            info
        end
# ---------Test Get an image-----------------------
        def self.getimage()
            "app/assets/images/award1.jpeg"
        end
        
# # ---------Test get something----------------------
#         def self.getsomething()
#             return "Hello World"
#         end
# ---------Test get superhero-----------------------
        def self.getsuperhero()
            testurl =  Net::HTTP.get(URI("https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/28.json"))
                superhero = JSON.parse(testurl)
                return superhero["name"]
        end

# -------------Get content--------------------------
        def self.getcontent()
            puts "<div> #{getweather()} </div>"
            puts "<div> #{getuselessfacts()} </div>"
            puts "<div> #{getsuperhero()} </div>"
            return "<div> #{getuselessfacts()} </div>"
        end
    end

