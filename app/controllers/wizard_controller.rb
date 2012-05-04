class WizardController < ApplicationController
  def setup
    @departments = Department.all
    @criteria = Criterium.all
  end

  def calculate
    
    college = params[:department]
    preferences = params[:criteria]
        
    cit = Department.find_by_abbr("CIT")
    hss = Department.find_by_abbr("H&SS")
    mcs = Department.find_by_abbr("MCS")
    scs = Department.find_by_abbr("SCS")
    cfa = Department.find_by_abbr("CFA")
    tepper = Department.find_by_abbr("Tepper")
    
    criteria = Criterium.all
    
    on_with = 0
		on_without = 0
		off_with = 0
		off_without = 0
		
    if college == hss.name
      #
    elsif college == cit.name
      preferences.each do |preference|
        if preference["name"] == criteria[0].name # Economic considerations
          puts "here"
          off_with += 1.0*Integer(preference["weight"])
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          on_with += 0.5*Integer(preference["weight"])
          on_without += 0.5*Integer(preference["weight"])
        elsif preference["name"] == criteria[2].name # Size
          off_with = 1.0*Integer(preference["weight"])
        elsif preference["name"] == criteria[3].name # Quality
          on_with += 0.5*Integer(preference["weight"])
          off_with += 0.25*Integer(preference["weight"])
          off_without += 0.25*Integer(preference["weight"])
        elsif preference["name"] == criteria[4].name # Social Life
          off_with += 1.0*Integer(preference["weight"])
        else # preference["name"] == criteria[5].name # Safety
          on_with += 0.5*Integer(preference["weight"])
          on_without += 0.5*Integer(preference["weight"])
        end
      end
    elsif college == mcs.name
    elsif college == scs.name
    elsif college == tepper.name
    else # college == cfa.name
    end
    
		best_decision = [on_with, on_without, off_with, off_without].max
		if best_decision == on_with
      @best_option = 'Live on campus with a roommate'
		elsif best_decision == on_without
			@best_option = 'Live on campus without a roommate'
		elsif best_decision == off_with
			@best_option = 'Live off campus with a roommate'
		elsif best_decision == off_without
			@best_option = 'Live off campus without a roommate'
		end
		
		puts "-------------------- on_with: #{on_with}"
		puts "-------------------- on_without: #{on_without}"
		puts "-------------------- off_with: #{off_with}"
		puts "-------------------- of_without: #{off_without}"
		puts "-------------------- #{@best_option}"
		@best_option
		
		
    redirect_to controller: 'wizard', action: 'show', best_option: @best_option, college: college, preferences: preferences
  end

  def show
    @best_option = params[:best_option]
    @college = params[:college]
    @preferences = params[:preferences]
  end
end
