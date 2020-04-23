require 'elevator_media'

describe Streamer do

    describe "get content" do

        context "get a useless quote" do
            it "return a useless quote as a string" do
                    expect(Streamer.getcontent).to be_kind_of String
            end
        end
# ---------Test API open_weather-------------
        context "Test to get realtime weather" do
            it "getting weather in realtime" do
                    expect(Streamer.getweather()).to_not eq(nil)
            end
        end

# ---------Test get an image-------------
        context "test to get image" do
            it "getting image" do
                expect(Streamer.getimage()).to eq("app/assets/images/award1.jpeg")
            end
        end

# ---------Test get something--------------
        context "Test to something" do
            it 'getting something' do
                expect(Streamer.getsomething()).to eq("Hello World")
            end
        end
    end
end

