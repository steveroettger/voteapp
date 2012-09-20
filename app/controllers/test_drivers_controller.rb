class TestDriversController < ApplicationController
  def index
    @test_driver = TestDriver.all
  end
  
  def new
    @test_driver = TestDriver.new
  end
  
  def create
    @test_driver = TestDriver.new(params[:test_driver])
    if @test_driver.save
      redirect_to new_test_driver_path, notice: 'Success.'
    else
      render 'new'
    end
  end
  
  def show 
    @test_driver = TestDriver.find(params[:id])
  end
end