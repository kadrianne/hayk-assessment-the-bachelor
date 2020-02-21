require 'pry'

def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  winner = contestants.find do |contestant|
    contestant["status"] == "Winner"
  end
  winner["name"].split[0]
end

def all_contestants(data)
  data.values.flatten
end

# def get_contestant_name(data, occupation)
#   #HoAoH
#   contestant = all_contestants(data).find do |hash|
#     hash["occupation"] == occupation
#   end
#   contestant["name"]
# end

def get_contestant_name(data, occupation)
  #HoAoH
  all_contestants(data).find do |hash|
    if hash["occupation"] == occupation
      return hash["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  all_contestants(data).reduce(0) do |total,hash|
    if hash["hometown"] == hometown
      total + 1
    else
      total
    end
  end
end

def get_occupation(data, hometown)
  all_contestants(data).find do |hash|
    if hash["hometown"] == hometown
      return hash["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  contestants = data[season]
  total_age = contestants.reduce(0) do |age,hash|
    age + hash["age"].to_i
  end
  average_age = (total_age/contestants.length.to_f).round()
end
