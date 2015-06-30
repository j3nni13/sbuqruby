module ApplicationHelper

def options_for_province
  ['AB', 'BC', 'MB', 'NB', 'NL', 'NU', 'NS', 'NT', 'ON', 'PE', 'QC', 'SK', 'YT']
end

def options_for_gender
  ['Female', 'Male', 'Other']
end

def active_page(active_page)
    @active == active_page ? "active" : ""
  end
  
end
