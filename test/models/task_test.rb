require_relative '../test_helper'

class TaskTest < Minitest::Test 
  def test_assigns_attributes_correctly
    data = {"id" => 1, "title" => "Test Title", "description" => "Test Description"}
    
    task = Task.new(data)
    
    assert_equal "Test Title", task.title
    assert_equal 1, task.id
    assert_equal "Test Description", task.description
  end
end