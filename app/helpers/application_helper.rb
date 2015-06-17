module ApplicationHelper

def options_for_gender
  ['Gender', 'Female', 'Male', 'Other']
end

def active_page(active_page)
    @active == active_page ? "active" : ""
  end
  
end
