require 'rspec'
require File.expand_path("../../../config/environment", __FILE__)

# Use nested methods when using more than one class 
describe TaskManager do
  describe "#all" do 
    before :each do 
      database = SQLite3::Database.new('db/task_manager_test.db')
      database.results_as_hash = true 
      @task_manager = TaskManager.new(database)
    end
    
    it "returns all my tasks" do 
      @task_manager.create("title" => "woo", "description" => "wooo")
      @task_manager.create("title" => "woo", "description" => "wooo")
      
      expect(@task_manager.all.count).to eq(2)
    end
  end
end