# we don't have NavigatonController, so helper methods defined inside NavigationHelper module
# won't be availabe anywhere.

# But the navigation bar is available across the whole website. We can include the Navigation 
# module to the ApplicationHelper.
module NavigationHelper

  def collapsible_links_partial_path
    if user_signed_in?
      'layouts/navigation/collapsible_elements/signed_in_links'
    else
      'layouts/navigation/collapsible_elements/non_signed_in_links'
    end
  end
end