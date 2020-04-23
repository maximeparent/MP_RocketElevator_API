require 'elevator_media'

describe Streamer do

    describe "get content" do
# ---------Test get content--------------
        context "Test to get content" do
            it 'getting content' do
                expect(Streamer.getcontent()).to eq("Hello World")
            end
        end
# ---------Test get an image-------------
        context "test to get image" do
            it "getting image" do
                expect(Streamer.getimage()).to eq("app/assets/images/award1.jpeg")
            end
        end
# ---------Test API open_weather-------------
        context "Test to get realtime weather" do
            it "getting weather in realtime" do
                expect(Streamer.realtimeweather()).to_not eq(nil)
            end
        end
        context "Test to get vimeo" do
            it "getting vimeo" do
                expect(Streamer.vimeovideo()).to_not eq(nil)
            end
        end
    end 
end
