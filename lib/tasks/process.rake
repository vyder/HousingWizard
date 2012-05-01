namespace :db do
  
  desc "Process data and tally relevant values"
  task :process => :environment do
    
    results = File.open("results.txt", 'w')
    
    n = Renter.all.count
    results.puts "Total number of records = #{n}\n\n"
    
    results.puts "\tTotal living on campus = #{Renter.lives_oncampus.count}"
    results.puts "\tTotal living off campus = #{Renter.lives_offcampus.count}"
    results.puts "\n"
    results.puts "Total living with a roommate = #{Renter.has_roommate.count}"
    results.puts "Total living alone = #{Renter.lives_alone.count}"
    results.puts "\n"
    
    departments = Department.all
    criteria = Criterium.all
    
    departments.each do |department|
      next if ["BHA", "BSA", "BCSA", "HCI", "IS"].include?(department.abbr)
      
      abbr = department.abbr
      records = Renter.from_department(abbr)
      
      results.puts "--- Department: #{department.abbr} - #{department.name}"
      results.puts "Number of records from #{abbr} = #{records.count}"
      results.puts "-"
      results.puts "Total living on campus = #{records.lives_oncampus.count}"
      results.puts "Total living off campus = #{records.lives_offcampus.count}"
      results.puts "\n"
      results.puts "Total living with a roommate = #{records.has_roommate.count}"
      results.puts "Total living alone = #{records.lives_alone.count}"
      results.puts "-"
      
      criteria.each do |c|
        subrecords = records.has_criterium(c.name)
        results.puts "#{c.name}: #{subrecords.count}"
        results.puts "\tLives on campus: #{subrecords.lives_oncampus.count}"
        results.puts "\t\tHas a roommate: #{subrecords.lives_oncampus.has_roommate.count}"
        results.puts "\t\tLives alone: #{subrecords.lives_oncampus.lives_alone.count}"
        results.puts "\tLives off campus: #{subrecords.lives_offcampus.count}"
        results.puts "\t\tHas a roommate: #{subrecords.lives_offcampus.has_roommate.count}"
        results.puts "\t\tLives alone: #{subrecords.lives_offcampus.lives_alone.count}"
        results.puts "-" unless c == criteria.last
      end
      
      results.puts "---\n\n\n\n\n"
    end
    
    results.puts "\n\n"
  end
  
end