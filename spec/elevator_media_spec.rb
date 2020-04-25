require 'elevator_media'
describe Streamer do
    # ---------Test in database------
    context "Test Get something in db" do
        it "Test (1) if we connect with db " do
        end
        it "Test (2) if we connect with db " do
            expect(Streamer.getsomethingindb()).to_not eq(nil)
        end
        it "Test if we connect with table's db"do
            expect(Streamer.getsomethingindb()).to_not eq(nil)
        end
        it "test if we can fetch data from a table" do
            expect(Streamer.getsomethingindb()).to_not eq(nil)
        end
        it "test if we can fetch data from a table as a string" do
            expect(Streamer.getsomethingindb()).to be_a(String)
        end
    end

# ---------Test get useless facts-------------
        
    context "get a useless facts" do
        it "return a fun quote as a string" do
                expect(Streamer.getuselessfacts).to be_kind_of String
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

# # ---------Test get something--------------
#         context "Test to get something" do
#             it 'getting something' do
#                 expect(Streamer.getsomething()).to eq("Hello World")
#             end
        # end
# ---------Test get superhero--------------
        describe "Getting superhero name" do
            it "superhero name:" do
                expect(Streamer.getsuperhero()).to be_a(String)
        end
    end
end
