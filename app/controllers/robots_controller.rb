class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :edit, :update, :destroy]
  before_filter :is_user_admin, only: [:create, :new]

  # GET /robots
  # GET /robots.json
  def index
    @robots = Robot.all
    @owned_robots = current_user.robots
    @your_voted_robots = Robot.all.select{|robot| robot.user_votes.any?{|vote| vote.user_id == current_user.id }}
  end

  def results
    @robots = Robot.all
  end

  # GET /robots/1
  # GET /robots/1.json
  def show
  end

  # GET /robots/new
  def new
    @owned_robots = current_user.robots
    @robots = Robot.all
    @robot = Robot.new
  end

  # GET /robots/1/edit
  def edit
  end

  # POST /robots
  # POST /robots.json
  def create
    @robot = Robot.new(robot_params)

    respond_to do |format|
      if @robot.save
        format.html { redirect_to new_robot_path, notice: 'Robot was successfully created.' }
        format.json { render :new, status: :created, location: @robot }
      else
        format.html { render :new }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robots/1
  # PATCH/PUT /robots/1.json
  def update
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to new_robot_path, notice: 'Robot was successfully updated.' }
        format.json { render :show, status: :ok, location: @robot }
      else
        format.html { render :new }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1
  # DELETE /robots/1.json
  def destroy
    @robot.destroy
    respond_to do |format|
      format.html { redirect_to new_robot_path, notice: 'Robot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end

    def is_user_admin
      if current_user.admin?

      else
        respond_to do |format|
          format.html { redirect_to robots_path, notice: 'You must be an admin to create a new robot. How about voteing for one instead!' }
          format.json { head :no_content }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_params
      params.require(:robot).permit(:image, :name, :user_id, :description)
    end
end
