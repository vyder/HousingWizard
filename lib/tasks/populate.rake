namespace :db do
  
  desc "Erase and fill database"
  task :populate => :environment do
    
    # Step 1: clear any old data in the db
    [Department, Criterium, RenterDepartment, RenterCriterium, Renter].each(&:delete_all)
      
    # Step 2: Populate departments
    departments = {"CIT" => "Carnegie Institute of Technology",
                   "CFA" => "College of Fine Arts",
                   "HSS" => "Humanities & Social Sciences",
                   "IS" => "Information Systems",
                   "MCS" => "Mellon College of Sciences",
                   "SCS" => "School of Computer Science",
                   "Tepper" => "Tepper School of Business",
                   "BHA" => "Bachelor of Humanities & Arts",
                   "BSA" => "Bachelor of Science & Arts",
                   "BCSA" => "Bachelor of CS & Arts",
                   "HCI" => "Human Computer Interaction"}
                   
    departments.each do |department_abbr, department_name|
      d = Department.new(name: department_name, abbr: department_abbr)
      d.save!
    end
    
    # Step 3: Populate Criteria
    criteria = ["Economic Considerations",
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
    
    # Step 4: Create renters' hash
    renters = [{
                roommate: true,
                oncampus: true,
                rent:1,
                notes: nil,
                departments: ["CIT", "HCI"],
                criteria: [criteria[0], criteria[2]]
                },
                {
                roommate: true,
                oncampus: false,
                rent:2,
                notes: nil,
                departments: ["IS", "HCI"],
                criteria: [criteria[1], criteria[3], criteria[2]]
                }]
    
    # Step 5: Create the renters
    renters.each do |renter|
      r = Renter.new(roommate:renter[:roommate], oncampus:renter[:oncampus], rent:renter[:rent], notes:renter[:notes])
      r.save!
      renter[:departments].each do |department|
        d = Department.find_by_abbr(department)
        relationship = RenterDepartment.new(department_id:d.id, renter_id:r.id)
        relationship.save!
      end
      renter[:criteria].each do |criterium|
        relationship = RenterCriterium.new(criterium_id:criterium.id, renter_id:r.id)
        relationship.save!
      end
    end
    
    
  end
  
end