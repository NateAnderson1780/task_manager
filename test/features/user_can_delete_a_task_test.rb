require_relative '../test_helper'

class UserCanDeleteATaskTest < FeatureTest

  def test_user_can_delete_a_task 
    visit '/'
    click_link("Task Index")
    assert '/tasks', current_path 
    
    fill_in("task[title]", :with => "Go to Mall")
    fill_in("task[description]", :with => "Get Presents")
    click_on("submit")
    # save_and_open_page
    
    assert page.has_content?("Go to Mall")
  end
  
end