require 'rspec'
require File.expand_path("../../../config/environment", __FILE__)

describe Task do 
  before :each do
    data = {"id" => 1, "title" => "Test Title", "description" => "Test Description"}
    @task = Task.new(data)
  end
  
  it "has a title" do 
    expect(@task.title).to eq("Test Title")
  end
  
  it "has a description" do
    expect(@task.description).to eq("Test Description")
  end
  
  
end