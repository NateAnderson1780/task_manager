require_relative '../test_helper'
require 'pry'

class TaskManagerTest < Minitest::Test
  include TestHelpers
  
  def current_task_id
    task_manager.all.last.id
  end
  
  def create_task
    task_manager.create({ :title        => "some title", 
                          :description => "some description"})
  end
  
  def number_of_tasks
    task_manager.all.count
  end
  
  def test_can_create_a_task
    assert_equal 0, number_of_tasks
    
    create_task
                          
    assert_equal 1, number_of_tasks
    
    
    # task = task_manager.find(current_task_id)
    # 
    # assert_equal "some title", task.title 
    # assert_equal current_task_id, task.id 
    # assert_equal "some description", task.description 
  end
  
  def test_it_returns_all_tasks 
    3.times {create_task}
                          
                          
    assert_equal 3, number_of_tasks 
    assert_instance_of Task, task_manager.all.first                
  end
  
  def test_it_finds_a_task
    create_task
                          
    task = task_manager.find(current_task_id)
    assert_instance_of Task, task 
  end
  
  def test_it_deletes_a_task
    create_task
    assert_equal 1, number_of_tasks 
    
    task_manager.destroy(current_task_id)
    assert_equal 0, number_of_tasks
  end
  
  def test_it_updates_a_task
    create_task
    
    params = {task: {title: "My new title", description: "My new description"}}
    task_manager.update(current_task_id, params[:task])
    
    task = task_manager.find(current_task_id)
    assert_equal "My new title", task.title 
    assert_equal "My new description", task.description 
  end
end