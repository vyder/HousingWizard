require 'iconv'
namespace :db do
  
  desc "Erase and fill database"
  task :populate => :environment do
    
    # Step 1: clear any old data in the db
    [Department, Criterium, RenterDepartment, RenterCriterium, Renter].each(&:delete_all)
      
    # Step 2: Populate departments
    departments = {"CIT" => "Carnegie Institute of Technology",
                   "CFA" => "College of Fine Arts",
                   "H&SS" => "Humanities & Social Sciences",
                   "IS" => "Information Systems",
                   "MCS" => "Mellon College of Sciences",
                   "SCS" => "School of Computer Science",
                   "Tepper" => "Tepper School of Business",
                   "BHA" => "Bachelor of Humanities & Arts",
                   "BSA" => "Bachelor of Science & Arts",
                   "BCSA" => "Bachelor of CS & Arts",
                   "BXA" => "Bachelor of X & Arts",
                   "HCI" => "Human Computer Interaction"}
                   
    departments.each do |department_abbr, department_name|
      d = Department.new(name: department_name, abbr: department_abbr)
      d.save!
    end
    departments = Department.all
    
    # Step 3: Populate Criteria
    criteria = ["Economic considerations",
                "Proximity to Campus",
                "Size",
                "Quality of Housing",
                "Social Life",
                "Safety"]
                
    criteria.each do |criterium_name|
      c = Criterium.new(name: criterium_name)
      c.save!
    end
    
    criteria = Criterium.all
    
    # Step 4: Pull renter survey data from db.text
    raw_file = File.open("db.txt").read
    file = raw_file.gsub!(/\r\n?/, "\n")

    renter_i = 1
    file.each_line do |line|
      columns = line.split(/\t/)
      
      renter = Renter.new
      # break if renter_i > 5
      i = 1
      columns.each do |cell|
        unless cell == ""
        
          # 1 is timestamp
          # ignore
          
          # 2 is either "I have a roommate" or "I live alone"
          renter.roommate = (cell == "I have a roommate") if i == 2
          
          # 3 is either "Off campus" or "On campus"
          renter.oncampus = (cell == "On campus") if i == 3
          
          # 4 is either "Under $500", "$500 - $800" or "Over $800 OR on campus"
          renter.rent = (cell == "Under $500" ? 1 : (cell == "$500 - $800" ? 2 : 3) ) if i == 4

          # 5 is department
          if i == 5
            renter.save! # can't do relationships without an id (we'll save again at the end)
            departments.each do |department|
              # if cell.length > 4 and department.name != "Tepper" and cell != "Tepper" and department.abbr == "H&SS"
              #   puts cell
              #   puts department.abbr
              #   puts cell.match(/#{department.abbr}/)
              #   puts "---"
              # end
              if cell.match(/#{department.abbr}/) # if this record has this department in it
                d = department
                relationship = RenterDepartment.new(department_id:d.id, renter_id:renter.id)
                relationship.save!
              end
            end
          end
                      
          # 6 is the criteria
          if i == 6
            renter.save! # can't do relationships without an id (we'll save again at the end)
            # puts cell
            criteria.each do |criterium|
              if cell.match(/#{criterium.name}/) # if this record has this department in it
                relationship = RenterCriterium.new(criterium_id:criterium.id, renter_id:renter.id)
                relationship.save!
              end
            end
          end
          
          # 7 is notes
          renter.notes = cell if i == 7
          
          # 8 is major
          # ignore
          
          i = i+1
        end
        # otherwise it was an empty column (and theres a shit load of these because you know, excel)
      end


      renter.save!
      
      renter_i = renter_i + 1
    end    
    
  end
  
end