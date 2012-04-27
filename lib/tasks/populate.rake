namespace :db do
  
  desc "Erase and fill database"
  task :populate => :environment do
    
    # Step 1: clear any old data in the db
    [Department].each(&:delete_all)
      
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
    
    # Step 3: Create renters' hash
    
    
    # Step 4: Create the renters
    
    
    
  end
  
end