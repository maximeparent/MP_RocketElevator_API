# require 'rails_helper'

# # ---------Test admin login --------------- 
# context "if you enter the right email and password combination on the admin panel" do
#     it "redirects you to the admin dashboard" do
#         visit 'users/sign_in'
#         fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
#         fill_in 'Password', with: '579010ab' do
#         expect(page).to have_text('Dashboard')
#         end
#     end
# end