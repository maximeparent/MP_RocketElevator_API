class InterventionsController < ApplicationController
    before_action :set_intervention, only: [:show, :edit, :update, :destroy]

    # GET /interventions
    # GET /interventions.json
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
        puts "***********************************"
        puts "buildings_for_customer"
        puts params
        buildings = Customer.find(params["selected_customer"]).buildings
        puts buildings
        render json: buildings
    end
  
    def batteries_for_building
        puts "***********************************"
        puts "batteries_for_building"
        puts params
        batteries = Building.find(params["selected_building"]).batteries
        puts batteries
        render json: batteries
    end
  
    def columns_for_battery
        puts "***********************************"
        puts "columns_for_battery"
        puts params
        columns = Battery.find(params["selected_battery"]).columns
        puts columns
        render json: columns
    end
  
    def elevators_for_column
        puts "***********************************"
        puts "elevators_for_column"
        puts params
        elevators = Column.find(params["selected_column"]).elevators
        puts elevators
        render json: elevators
    end
end

