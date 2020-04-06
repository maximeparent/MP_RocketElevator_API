require 'zendesk_api'

class LeadsController < ApplicationController
    def index
        @lead = Lead.all
    end

    # ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
    # ZendeskAPI::Ticket.create!(@client, :subject => " '#{user_name}' from #{company_name}", 
    # :comment => { :value => "
    # Comment: The contact '#{user_name}' from company '#{company_name}'can be reached at email  '#{email}' and at 
    # phone number #{phone_number}. #{department} has a project named #{project_name} which would require contribution from Rocket 
    # Elevators. 
    # #{project_description}
    # Attached Message: #{message}
    # The Contact uploaded an attachment
    # " },  
    # :priority => "urgent") 
    # end

    def create

        puts params
        
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV["ZENDESK_URL"]
            config.username = ENV["ZENDESK_USERNAME"]
            # config.token = ""
            config.password = ENV["ZENDESK_PASSWORD"]
            # config.access_token = ""

            config.retry = true
            config.raise_error_when_rate_limited = false
            require 'logger'
            config.logger = Logger.new(STDOUT)
        end  


        p = params["leads"].permit!
        # puts p
        @lead = Lead.new(p)

        #puts 'CURRENT USER'
        #pp current_user

        # @lead.user = current_user
        @lead.save!

        # Subject: [Full Name] from [Company Name]
        ZendeskAPI::Ticket.create!(client, :type => "question", :subject => "#{@lead.name} from #{@lead.businessname}", :comment => { :value => "*The contact* #{@lead.name} *from company* #{@lead.businessname} *can be reached at email* #{@lead.email} *and at phone number* #{@lead.phone}. #{@lead.department} *has a project named* #{@lead.projectname} *which would require contribution from Rocket Elevators.*\n\n #{@lead.description} \n\n Attached Message: #{@lead.message} \n\n #{@lead.attachment == nil ? "" : "*The Contact uploaded an attachment*"}" }, :submitter_id => client.current_user.id, :priority => "urgent")
        
        ApplicationMailer.send_task_complete_email.deliver_now
        redirect_to message_path
    end
end

#     private
#     def contact_params
#     params.require(:leads).permit(:name, :email, :projectname)
#     end
# end

