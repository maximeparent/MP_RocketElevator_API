require 'zendesk_api'
class InterventionsController < ApplicationController
      
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]

    def new
        @intervention = Intervention.new(intervention_params)
    end
    def create
        @intervention = Intervention.new(intervention_params)

            zendesk_ticket_intervention(@intervention)

        respond_to do |format|
            if @intervention.save
              format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
            else
                format.html { render :new_intervention }

              end
            end
          end

    def intervention_params
            params.fetch(:intervention, {}).permit(:user_id, :bulding_name, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end

    def zendesk_ticket_intervention(intervention)
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
        
        comment = { :value =>  "There's a problem with the customer # #{intervention.customer_id} \n In The Building # #{intervention.building_id} \n The Battery # #{intervention.battery_id}  \n the Column # #{intervention.column_id} \n The Elevator # #{intervention.elevator_id} \n \n This is the description provides by the employee : \n #{intervention.report} "}
        
        ZendeskAPI::Ticket.create!(client, :type => 'task', :priority => "urgent",
        :subject => 'New Intervention',
        :comment => comment,
        )
        end
    end
    

#     def buildings_by_customer
#       @building = Customer.where(customer_id: params[:selected_customer]).first.buildings
#     end
    
#     def buildings_for_customer
#         puts params
#         buildings = Customer.find(params["selected_customer"]).buildings
#         puts buildings
#         render json: buildings
#     end
  
#     def batteries_for_building
#         puts params
#         batteries = Building.find(params["selected_building"]).batteries
#         puts batteries
#         render json: batteries
#     end
  
#     def columns_for_battery
#         puts params
#         columns = Battery.find(params["selected_battery"]).columns
#         puts columns
#         render json: columns
#             end
  
#     def elevators_for_column
#         puts params
#         elevators = Column.find(params["selected_column"]).elevators
#         puts elevators
#         render json: elevators

# end

