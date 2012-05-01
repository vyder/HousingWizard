namespace :db do
  
  desc "Process data and tally relevant values"
  task :process => :environment do
    
    n = Renter.all.count
    puts "Total number of records = #{n}\n\n"
    
    
    oncampus = Renter.where('oncampus = ?', true)
    offcampus = Renter.where('oncampus = ?', false)
    
    puts "Number living on campus = #{oncampus.count}"
    puts "Number living off campus = #{offcampus.count}"
    
    puts "\n\n"
    
    roommate = Renter.where('roommate = ?', true)
    alone = Renter.where('roommate = ?', false)
    
    puts "Number living with a roommate = #{roommate.count}"
    puts "Number living alone = #{alone.count}"
    
    puts "\n\n"
    
    departments = Department.all
    
    departments.each do |department|
      next if ["BHA", "BSA", "BCSA"].include?(department.abbr)
      
      abbr = department.abbr
      records = Renter.from_department(abbr)
      
      puts "---"
      puts "Number of records from #{abbr} = #{records.count}"
      puts "-"
      puts "\tNumber of people with"
      
      puts "\n\n"
    end
    
  end
  
end