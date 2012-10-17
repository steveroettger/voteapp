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
      TestDriverMailer.new_test_driver(@test_driver).deliver
      redirect_to new_test_driver_path
    else
      render 'new'
    end
  end
  
  def show 
    @test_driver = TestDriver.find(params[:id])
  end
end