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
    
    decisions = {on_with: 0, on_without: 0, off_with: 0, off_without: 0}
		
    if college == hss.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:on_with] += 0.1*weight
          decisions[:on_without] += 0.07*weight
          decisions[:off_with] += 0.5*weight
          decisions[:off_without] += 0.3*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:on_with] += 0.35*weight
          decisions[:on_without] += 0.15*weight
          decisions[:off_with] += 0.35*weight
          decisions[:off_without] += 0.15*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:on_with] += 0.35*weight
          decisions[:on_without] += 0.05*weight
          decisions[:off_with] += 0.4*weight
          decisions[:off_without] += 0.2*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:on_with] += 0.42*weight
          decisions[:on_without] += 0.08*weight
          decisions[:off_with] += 0.2*weight
          decisions[:off_without] += 0.3*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:on_with] += 0.4*weight
          decisions[:on_without] += 0.1*weight
          decisions[:off_with] += 0.3*weight
          decisions[:off_without] += 0.2*weight
        else # preference["name"] == criteria[5].name # Safety
          decisions[:off_with] += 0.5*weight
          decisions[:off_without] += 0.5*weight
        end
      end
    elsif college == cit.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:off_with] += 1.0*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:on_with] += 0.5*weight
          decisions[:on_without] += 0.5*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:off_with] += 1.0*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:on_with] += 0.5*weight
          decisions[:off_with] += 0.25*weight
          decisions[:off_without] += 0.25*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:off_with] += 1.0*weight
        else # preference["name"] == criteria[5].name # Safety
          decisions[:on_with] += 0.5*weight
          decisions[:on_without] += 0.5*weight
        end
      end
    elsif college == mcs.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:on_with] += 0.333*weight
          decisions[:off_with] += 0.667*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:on_with] += 0.7*weight
          decisions[:off_with] += 0.3*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:on_with] += 0.5*weight
          decisions[:off_with] += 0.5*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:on_with] += 0.6*weight
          decisions[:off_with] += 0.4*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:on_with] += 0.75*weight
          decisions[:off_with] += 0.25*weight
        else # preference["name"] == criteria[5].name # Safety
          # no preference
        end
      end
    elsif college == scs.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:on_with] += 0.333*weight
          decisions[:on_without] += 0.333*weight
          decisions[:off_with] += 0.333*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:on_with] += 1.0*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:on_with] += 0.5*weight
          decisions[:off_without] += 0.5*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:on_with] += 0.4*weight
          decisions[:off_with] += 0.2*weight
          decisions[:off_without] += 0.4*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:on_with] += 1.0*weight
        else # preference["name"] == criteria[5].name # Safety
          decisions[:on_with] += 1.0*weight
        end
      end
    elsif college == tepper.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:on_with] += 0.333*weight
          decisions[:off_with] += 0.667*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:on_with] += 0.53*weight
          decisions[:off_with] += 0.24*weight
          decisions[:off_without] += 0.23*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:on_with] += 0.333*weight
          decisions[:on_without] += 0.667*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:on_with] += 1.0*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:on_with] += 1.0*weight
        else # preference["name"] == criteria[5].name # Safety
          decisions[:on_with] += 1.0*weight
        end
      end
    else # college == cfa.name
      preferences.each do |preference|
        weight = Integer(preference["weight"])
        if preference["name"] == criteria[0].name # Economic considerations
          decisions[:off_without] += 1.0*weight
        elsif preference["name"] == criteria[1].name # Proximity to Campus (close)
          decisions[:off_without] += 1.0*weight
        elsif preference["name"] == criteria[2].name # Size
          decisions[:off_with] += 0.5*weight
          decisions[:off_without] += 0.5*weight
        elsif preference["name"] == criteria[3].name # Quality
          decisions[:off_with] += 0.4*weight
          decisions[:off_without] += 0.6*weight
        elsif preference["name"] == criteria[4].name # Social Life
          decisions[:off_with] += 0.667*weight
          decisions[:off_without] += 0.333*weight
        else # preference["name"] == criteria[5].name # Safety
          decisions[:on_with] += 0.5*weight
          decisions[:off_with] += 0.5*weight
        end
      end
    end
    
    equal_decisions = []
    occurrences = {}

    decisions.keys.each do |decision|
      next if decisions[decision] == 0
      if occurrences.has_key?(decisions[decision])
        occurrences[decisions[decision]] << decision
      else
        occurrences[decisions[decision]] = [decision]
      end
    end

    puts occurrences.inspect
    
    occurrences.keys.each do |key|
      equal_decisions << occurrences[key] if occurrences[key].size > 1
    end

    equal_decisions = [] if occurrences.keys == 4
    
    # best_decision = [decisions[:on_with], decisions[:on_without], decisions[:off_with], decisions[:off_without]].max
    best_decision = decisions.sort_by {|k,v| v}.last[0]
				
    if equal_decisions.flatten.include?(best_decision)
  	  equal_decisions.each do |group|
  	    next if !group.include?(best_decision)

  	    on_campus = group.include?(:on_with) or group.include?(:on_without)
  	    off_campus = group.include?(:off_with) or group.include?(:off_without)
  	    with = group.include?(:on_with) or group.include?(:off_with)
  	    without = group.include?(:on_without) or group.include?(:off_without)
        puts "**** here"
  	    @best_option = "Live"
  	    if on_campus and off_campus
    	    @best_option += " on or off campus"
  	    else
          case best_decision
          when :on_with, :on_without
            @best_option += " on campus"
          when :off_with, :off_without
            @best_option += " off campus"
          end
        end
        if with and without
    	    @best_option += " with or without a roommate"
  	    else
          case best_decision
          when :on_with, :off_with
            @best_option += " with a roommate"
          when :off_without, :off_without
            @best_option += " without a roommate"
          end
        end
      end
		elsif best_decision == :on_with
      @best_option = 'Live on campus with a roommate'
		elsif best_decision == :on_without
			@best_option = 'Live on campus without a roommate'
		elsif best_decision == :off_with
			@best_option = 'Live off campus with a roommate'
		elsif best_decision == :off_without
			@best_option = 'Live off campus without a roommate'
		end
		
		puts "-------------------- decisions[:on_with]: #{decisions[:on_with]}"
		puts "-------------------- decisions[:on_without]: #{decisions[:on_without]}"
		puts "-------------------- decisions[:off_with]: #{decisions[:off_with]}"
		puts "-------------------- decisions[:off_without]: #{decisions[:off_without]}"
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
