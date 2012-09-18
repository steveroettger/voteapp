class TestDriversController < ApplicationController
  def index
    @test_driver = TestDriver.all
  end
  
  def new
    @test_driver = TestDriver.new
  end
  
  def create
    @test_driver = TestDriver.new(params[:TestDriver])
    if @test_driver.save
      redirect_to @test_driver, notice: 'Thank you for your interest, someone will get back to you shortly.'
    else
      render 'new'
    end
  end
  
  def show 
    @contestant = Contestant.find(params[:id])
  end
end