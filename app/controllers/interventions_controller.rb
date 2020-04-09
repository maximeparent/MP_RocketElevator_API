require 'zendesk_api'
class InterventionsController < ApplicationController
    puts "=========================================="
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]

    def new
        puts "==================new========================"
        @intervention = Intervention.new(intervention_params)
    end
    def create
        puts "====================create======================"
        @intervention = Intervention.new(intervention_params)

            zendesk_ticket_intervention(@intervention)

        respond_to do |format|
            if @intervention.save
                puts "======================condition 1===================="
              format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
            else
                puts"======================condition 2===================="
                format.html { render :new_intervention }

              end
            end
          end

    def intervention_params
            puts "======================parameters===================="
            params.fetch(:intervention, {}).permit(:user_id, :bulding_name, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end

    def zendesk_ticket_intervention(intervention)

        customer = intervention.customer
        customer_name = customer.business_name
  
        building = intervention.building
  
        employee = intervention.employee
        employee_name = (employee.firstName + " " + employee.name)
  
        comment = { :value => "#{current_user.firstName} #{current_user.name} requested an intervention for #{customer_name}. \n \n There is a problem with the Building # #{intervention.building_id} \n Battery # #{intervention.battery_id} \n Column # #{intervention.column_id} \n Elevator # #{intervention.elevator_id} \n \n The employee #{employee_name} will cover the intervention based on the Report: \n #{intervention.report} "}
    
        ZendeskAPI::Ticket.create!($client, :type => 'task', :priority => "urgent",
        :subject => 'New Intervention',
        :comment => comment,
        :submitter_id => $client.current_user.token
        )


    
    def index
      @user = current_user
      @interventions = Intervention.all
      @customer = []
      @building = []
      @battery = []
      @column = []
      @elevator = []
    end

    def buildings_by_customer
      @building = Customer.where(customer_id: params[:selected_customer]).first.buildings
    end
    
    def buildings_for_customer
        puts params
        buildings = Customer.find(params["selected_customer"]).buildings
        puts buildings
        render json: buildings
    end
  
    def batteries_for_building
        puts params
        batteries = Building.find(params["selected_building"]).batteries
        puts batteries
        render json: batteries
    end
  
    def columns_for_battery
        puts params
        columns = Battery.find(params["selected_battery"]).columns
        puts columns
        render json: columns
    end
  
    def elevators_for_column
        puts params
        elevators = Column.find(params["selected_column"]).elevators
        puts elevators
        render json: elevators
    end

end

