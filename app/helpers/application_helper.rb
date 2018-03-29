module ApplicationHelper
  def url_for_twitter(user)
    "https://twitter.com/#{@event.owner.nickname}"
  end
end
