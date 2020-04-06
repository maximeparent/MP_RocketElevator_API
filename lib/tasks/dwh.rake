task spec: ["dwh:db:test:prepare"]

namespace :dwh do

  require 'pg'
  task update: [:cleardwh, :populate]

  task print: :environment do
    mysqldb = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
    puts mysqldb.connection.current_database
    # conn = PG::Connection.open(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', dbname: 'DavidAmyot', user: 'codeboxx', password: 'Codeboxx1!')
    # puts conn
  end
  
  task clear: :environment do
    # Clearing the database
    mysqldb = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
    puts mysqldb.connection.current_database
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 0;")
    mysqldb.connection.execute("TRUNCATE adresses")
    mysqldb.connection.execute("TRUNCATE batteries")
    mysqldb.connection.execute("TRUNCATE building_details")
    mysqldb.connection.execute("TRUNCATE buildings")
    mysqldb.connection.execute("TRUNCATE columns")
    mysqldb.connection.execute("TRUNCATE customers")
    mysqldb.connection.execute("TRUNCATE elevators")
    mysqldb.connection.execute("TRUNCATE leads")
    mysqldb.connection.execute("TRUNCATE quotes")
    mysqldb.connection.execute("TRUNCATE users")
    mysqldb.connection.execute("TRUNCATE roles")
    mysqldb.connection.execute("TRUNCATE users_roles")
    mysqldb.connection.execute("TRUNCATE employees")
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 1;")
    puts "Cleared tables"
  end

  task cleardwh: :environment do 
    conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
    #conn = PG::Connection.open(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', dbname: 'DavidAmyot', user: 'codeboxx', password: 'Codeboxx1!')
    puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"
    conn.exec("TRUNCATE TABLE dimcustomers RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factcontact RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factelevator RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factintervention RESTART IDENTITY;")
    puts "Cleared table"
  end

  task fake: :environment do
    # Clearing the database
    mysqldb = ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['development'])
    puts mysqldb.connection.current_database
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 0;")
    mysqldb.connection.execute("TRUNCATE adresses")
    mysqldb.connection.execute("TRUNCATE batteries")
    mysqldb.connection.execute("TRUNCATE building_details")
    mysqldb.connection.execute("TRUNCATE buildings")
    mysqldb.connection.execute("TRUNCATE columns")
    mysqldb.connection.execute("TRUNCATE customers")
    mysqldb.connection.execute("TRUNCATE elevators")
    mysqldb.connection.execute("TRUNCATE leads")
    mysqldb.connection.execute("TRUNCATE quotes")
    mysqldb.connection.execute("TRUNCATE users")
    mysqldb.connection.execute("TRUNCATE roles")
    mysqldb.connection.execute("TRUNCATE users_roles")
    mysqldb.connection.execute("TRUNCATE employees")
    mysqldb.connection.execute("SET FOREIGN_KEY_CHECKS = 1;")
    puts "Cleared table"

    # Creating the roles
    Role.create!(id: 1, name: 'admin')if Rails.env.development?
    Role.create!(id: 2, name: 'customer')if Rails.env.development?
    Role.create!(id: 3, name: 'employee')if Rails.env.development?

    # Generate employee user and account
    user = User.create!(username: 'Nicolasgenest', email: 'nicolas.genest@codeboxx.biz', company: 'Codeboxx1', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Nadyafortier', email: 'nadya.fortier@codeboxx.biz', company: 'Codeboxx2', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    user = User.create!(username: 'Martinchantal', email: 'martin.chantal@codeboxx.biz', company: 'Codeboxx3', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    user = User.create!(username: 'Mathieuhoude', email: 'mathieu.houde@codeboxx.biz', company: 'Codeboxx4', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
    user = User.create!(username: 'Remigagnon', email: 'remi.gagnon@codeboxx.biz', company: 'Codeboxx5', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Mathieulefrancois', email: 'mathieu.lefrancois@codeboxx.biz', company: 'Codeboxx6', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Sergesavoie', email: 'serge.savoie@codeboxx.biz', company: 'Codeboxx7', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Davidboutin', email: 'david.boutin@codeboxx.biz', company: 'Codeboxx8', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Mathieulortie', email: 'mathieu.lortie@codeboxx.biz', company: 'Codeboxx9', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    user = User.create!(username: 'Thomascarrier', email: 'thomas.carrier@codeboxx.biz', company: 'Codeboxx10', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
    employee = Employee.create!(name: 'Genest', firstName: 'Nicolas', title: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Fortier', firstName: 'Nadya', title: 'Director', email: 'nadya.fortier@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Chantal', firstName: 'Martin', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Houde', firstName: 'Mathieu', title: 'Captain', email: 'mathieu.houde@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Gagnon', firstName: 'Remi', title: 'Engineer', email: 'remi.gagnon@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Lefrancois', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Savoie', firstName: 'Serge', title: 'Engineer', email: 'serge.savoie@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Boutin', firstName: 'David', title: 'Engineer', email: 'david.boutin@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Lortie', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', user: user) if Rails.env.development?
    employee = Employee.create!(name: 'Carrier', firstName: 'Thomas', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz', user: user) if Rails.env.development?
    
    # Generate fake leads
    100.times do
      lead = Lead.create(
          name: Faker::Name.name,
          businessname: Faker::Artist.name,
          email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number,
          projectname: Faker::Artist.name,
          description: Faker::IndustrySegments.industry,
          department: "Elevators",
          message: Faker::Books::Lovecraft.paragraph,
          # attachment: Faker::Avatar.image,
          date: Faker::Date.between(from: 1000.days.ago, to: Date.today)
      )
      quote = Quote.create(
        NumAppartment: Faker::Number.between(from: 30, to: 300),
        NumFLoors: Faker::Number.between(from: 5, to: 50),
        NumBasement: Faker::Number.between(from: 1, to: 5),
        NumParking: Faker::Number.between(from: 10, to: 70),
        NumBusiness: Faker::Number.between(from: 1, to: 20),
        NumElevatorsDesired: Faker::Number.between(from: 1, to: 10),
        NumOccupantsPerFloor: Faker::Number.between(from: 20, to: 100),
        NumELevatorEstimated: Faker::Number.between(from: 1, to: 10),
        InstallFee: Faker::Number.between(from: 10000, to: 50000),
        SubTotal: Faker::Number.between(from: 10000, to: 50000),
        TotalPrice: Faker::Number.between(from: 10000, to: 50000),
        JobQuality:  ["Standard", "Premium", "Excellium"].sample,
        user_id: User.offset(rand(User.count)).first.id 
      )
      require 'json'
      file = File.read('adress.json')
      data_hash = JSON.parse(file)
      indexAdress = rand(0...95)
      address = Adress.create!(
        type_adress: [:Billing, :Shipping, :Home, :Business].sample,
        status: [:Active, :Inactive].sample,
        entity: [:Building, :Customer].sample,
        num_street: data_hash["addresses"][indexAdress]["address1"],
        suite: data_hash["addresses"][indexAdress]["address2"],
        city: data_hash["addresses"][indexAdress]["city"],
        postal_code: data_hash["addresses"][indexAdress]["postalCode"],
        country: data_hash["addresses"][indexAdress]["state"],
        longitude: data_hash["addresses"][indexAdress]["lng"],
        latitude: data_hash["addresses"][indexAdress]["lat"],
        notes: "Note"
      )
      customer = Customer.create(
        creation_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
        company_name: Faker::Artist.name,
        contact_fullname: Faker::Artist.name,
        contact_phone: Faker::PhoneNumber.phone_number,
        company_email: Faker::Internet.email,
        company_description: Faker::IndustrySegments.industry,
        service_technical_authority_fullname: Faker::Name.name,
        service_technical_authority_phone: Faker::PhoneNumber.phone_number,
        technical_manager_email: Faker::Internet.email,
        user_id: User.offset(rand(User.count)).first.id,
        adress_id: address.id
      )
      building = Building.create!(
        building_name: Faker::Artist.name,
        building_admin_name: Faker::Name.name,
        building_admin_email: Faker::Internet.email,
        building_admin_phone: Faker::PhoneNumber.phone_number,
        technical_contact_fullname: Faker::Artist.name,
        technical_contact_email: Faker::Internet.email,
        technical_contact_phone: Faker::PhoneNumber.phone_number,
        customer_id: customer.id,
        adress_id: address.id,
        user_id: User.offset(rand(User.count)).first.id,
        longitude: data_hash["addresses"][indexAdress]["lng"],
        latitude: data_hash["addresses"][indexAdress]["lat"]
      )
      building_details = BuildingDetail.create!(
        [
          { key: "Number of Floors", value: Faker::Number.between(from: 2, to: 50), building_id: building.id, user_id: User.offset(rand(User.count)).first.id},
          { key: "Type", value: ["Residential", "Commercial", "Corporate", "Hybrid"].sample, building_id: building.id, user_id: User.offset(rand(User.count)).first.id},
          { key: "Architecture", value: ["Modern", "Normal", "Greek", "Ancient"].sample, building_id: building.id, user_id: User.offset(rand(User.count)).first.id},
          { key: "Max Occupants", value: Faker::Number.between(from: 10, to: 1000), building_id: building.id, user_id: User.offset(rand(User.count)).first.id},
          { key: "Year of Construction", value: Faker::Date.between(from: 1000.days.ago, to: 200.days.ago), building_id: building.id, user_id: user.id}
        ]
      )
      battery = Battery.create!(
        type_battery: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
        status: ["Active", "Maintenance", "Inactive"].sample,
        commissioning_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
        last_inspection_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
        certificate_operations: ["YES", "NO", "IN PROCESS"].sample,
        notes: ["lorem", "ipsum"].sample,
        information: Faker::IndustrySegments.industry,
        building_id: building.id,
        employee_id: Employee.offset(rand(Employee.count)).first.id 
      )
      2.times do 
        column = Column.create(
          type_column: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
          status: ["Active", "Maintenance", "Inactive"].sample,
          number_floors: Faker::Number.between(from: 1, to: 70),
          information: Faker::IndustrySegments.industry,
          battery_id: battery.id
        )
        2.times do
          elevator = Elevator.create(
            serial_number: Faker::Number.number(digits: 7),
            model: Faker::Artist.name,
            type_elevator: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
            status: ["Active", "Maintenance", "Inactive"].sample,
            commissioning_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),
            inspection_date: Faker::Date.between(from: 1000.days.ago, to: Date.today),  
            certificate_inspection: Faker::Date.between(from: 1000.days.ago, to: Date.today),  
            information: Faker::IndustrySegments.industry,
            column_id: column.id
          )
        end
      end   
      puts "Inserting lead #{lead.id}, quote #{quote.id}, address #{address.id}, customer #{customer.id}, building #{building.id}, battery #{battery.id}"
    end
    puts "Finished inserting records"
  end

  task populate: :environment do
    require 'faker'
    #conn = PG::Connection.open(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', dbname: 'DavidAmyot', user: 'codeboxx', password: 'Codeboxx1!')
    conn = PG::Connection.open(dbname: 'datawarehouse', user: 'jeunex', password: 'codeboxx')
    puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

    # FACT QUOTES
    Quote.all.each do |q|
      puts "INSERT INTO factquotes (quoteid, creation, company, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', #{q.user.company}, #{q.user.email}, #{q.NumELevatorEstimated})"
      conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{q.user.company}', '#{q.user.email}', #{q.NumELevatorEstimated})")
    end 

    # FACT CONTACT
    Lead.all.each do |l|
      puts "INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.businessname}', '#{l.email}', #{l.projectname})"
      conn.exec("INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.businessname}', '#{l.email}', '#{l.projectname}')")
    end

    # FACT ELEVATOR
    Elevator.all.each do |e|
      puts "INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.commissioning_date}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.adress_id}')"
      conn.exec("INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.commissioning_date}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.adress_id}')")
    end

    # DIMENSION CUSTOMERS
    Customer.all.each do |a|
      nbelevators = 0
      a.buildings.all.each do |b|
          b.batteries.all.each do |c|
              c.columns.all.each do |d|
                nbelevators += d.elevators.count
              end
          end
      end
      puts "INSERT INTO dimcustomers (creationdate, companyname, companycontactfullname, companycontactemail, nbelevators, customercity) VALUES ('#{a.creation_date}', '#{a.company_name}', '#{a.contact_fullname}', '#{a.company_email}', #{nbelevators}, '#{a.adress.city}')"
      conn.exec("INSERT INTO dimcustomers (creationdate, companyname, companycontactfullname, companycontactemail, nbelevators, customercity) VALUES ('#{a.creation_date}', '#{a.company_name}', '#{a.contact_fullname}', '#{a.company_email}', #{nbelevators}, '#{a.adress.city}')")
    end

    # FACT INTERVENTION
    Building.all.each do |b|
      puts "INSERT INTO factintervention (employee_id, building_id, battery_id, column_id, elevator_id, start_date, end_date, result, report, status) VALUES (#{b.batteries.all.sample.employee_id}, #{b.id}, #{b.batteries.all.sample.id}, #{b.batteries.all.sample.columns.all.sample.id}, #{b.batteries.all.sample.columns.all.sample.elevators.all.sample.id}, '#{Faker::Date.between(from: 50.days.ago, to: 5.days.ago)}', '#{Faker::Date.between(from: 5.days.ago, to: Date.today)}', '#{["Success", "Failure", "Incomplete"].sample}', '#{["lorem", "ipsum"].sample}', '#{["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].sample}')"
      conn.exec("INSERT INTO factintervention (employee_id, building_id, battery_id, column_id, elevator_id, start_date, end_date, result, report, status) VALUES (#{b.batteries.all.sample.employee_id}, #{b.id}, #{b.batteries.all.sample.id}, #{b.batteries.all.sample.columns.all.sample.id}, #{b.batteries.all.sample.columns.all.sample.elevators.all.sample.id}, '#{Faker::Date.between(from: 50.days.ago, to: 5.days.ago)}', '#{Faker::Date.between(from: 5.days.ago, to: Date.today)}', '#{["Success", "Failure", "Incomplete"].sample}', '#{["lorem", "ipsum"].sample}', '#{["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].sample}')")
    end

    puts "Finished inserting records"
  end

########################################################################################################################
########################################################################################################################

  namespace :db do |ns|

    task :drop do
      Rake::Task["db:drop"].invoke
    end

    task :create do
      Rake::Task["db:create"].invoke
    end

    task :setup do
      Rake::Task["db:setup"].invoke
    end

    task :migrate do
      Rake::Task["db:migrate"].invoke
    end

    task :status do
      Rake::Task["db:migrate:status"].invoke
    end

    task :rollback do
      Rake::Task["db:rollback"].invoke
    end

    task :seed do
      Rake::Task["db:seed"].invoke
    end

    task :version do
      Rake::Task["db:version"].invoke
    end

    namespace :schema do
      task :load do
        Rake::Task["db:schema:load"].invoke
      end

      task :dump do
        Rake::Task["db:schema:dump"].invoke
      end
    end

    namespace :test do
      task :prepare do
        Rake::Task["db:test:prepare"].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ["dwh:set_custom_config"] do
        Rake::Task["dwh:revert_to_original_config"].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: ENV['SCHEMA'],
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    # ENV['SCHEMA'] = "db/schema.rb"
    # Rails.application.config.paths['db']
    # Rails.application.config.paths['db/migrate']
    # Rails.application.config.paths['db/migrate/status']
    # Rails.application.config.paths['db/seeds']
    # Rails.application.config.paths['config/database']

    ENV['SCHEMA'] = "db_dwh/schema.rb"
    Rails.application.config.paths['db'] = ["db_dwh"]
    Rails.application.config.paths['db/migrate'] = ["db_dwh/migrate"]
    Rails.application.config.paths['db/migrate/status'] = ["db_dwh/migrate/status"]
    Rails.application.config.paths['db/seeds'] = ["db_dwh/seeds.rb"]
    Rails.application.config.paths['config/database'] = ["config/dwh_database.yml"]
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end