# require 'rails_helper'

# # ------------------------------------------ USING THE SUBMISSION DEF IN QUOTE CONTROLLER --------------------------------------------------------

# # It supose to return a reponse 200 wich is a PASS reponse

# RSpec.describe quotes_Controller, :type => :controller do
#     describe "GET submission in the quote controller" do
#       it "has a 200 status code" do
#         get :submission
#         expect(response.status).to eq(200)
#       end
#     end
#   end
# # # ---------Test admin login --------------- 
# # context "if you enter the right email and password combination on the admin panel" do
# #     it "redirects you to the admin dashboard" do
# #         visit 'users/sign_in'
# #         fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
# #         fill_in 'Password', with: '579010ab' do
# #         expect(page).to have_text('Dashboard')
# #         end
# #     end
# # end