require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_users_can_create_a_new_task 
    visit '/'
    click_link("New Task")
    assert '/tasks/new', current_path 
    
    fill_in("task[title]", :with => "Go to Mall")
    fill_in("task[description]", :with => "Get Presents")
    click_on("submit")
    # save_and_open_page
    
    assert page.has_content?("Go to Mall")
  end
  
end