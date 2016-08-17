require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers
  def test_can_create_a_task
    task_manager.create({ :title        => "some title", 
                          :description => "some description"})
    
    task = task_manager.find(1)
    
    assert_equal "some title", task.title 
    assert_equal 1, task.id 
    assert_equal "some description", task.description 
  end
end