class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def dashboard
    @robots = Robot.all
    @owned_robots = current_user.robots
    @non_voted_robots = Robot.all.select{|robot| !robot.user_votes.any?{|vote| vote.user_id == current_user.id }}
    @your_voted_robots = Robot.all.select{|robot| robot.user_votes.any?{|vote| vote.user_id == current_user.id }}
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

end
