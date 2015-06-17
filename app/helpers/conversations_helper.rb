module ConversationsHelper
 def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}'>#{user.fullname}</option>"
    end
    s.html_safe
  end

  def recipients_options(chosen_recipient = nil)
  s = ''
  User.all.each do |user|
    s << "<option value='#{user.id}'#{'selected' if user == chosen_recipient}>#{user.fullname}</option>"
  end
  s.html_safe
end

 def subject_options
    s = ''
    Listing.all.each do |listing|
      s << "<option value='#{listing.title}'>#{listing.title}</option>"
    end
    s.html_safe
  end

  def subject_options(chosen_splisting = nil)
  s = ''
  Listing.all.each do |listing|
    s << "<option value='#{listing.title}'#{'selected' if listing == chosen_splisting}>#{listing.title}</option>"
  end
  s.html_safe
end

end
