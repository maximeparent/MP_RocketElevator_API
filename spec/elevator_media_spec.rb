require 'elevator_media'

describe Streamer do

    describe "get content" do

        context "Test to get something" do
            it 'getting something' do
            expect(Streamer.getcontent()).to eq(nil)

            end
        end
        context "test to get image" do
            it "getting image" do
                expect(Streamer.getimage()).to eq("app/assets/images/award1.jpeg")
            end
        end
        context "realtime weather" do
            it "give weather in realtime" do
                expect(Streamer.realtimeweather()).to_not eq(nil)
            end
        end
    end 
end
