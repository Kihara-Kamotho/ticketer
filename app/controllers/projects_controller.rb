class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, flash: {notice: "project created successfully"}
    else
      render :new
      flash[:alert] = "Project not created"
    end
  end

  def show
    # @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @project.update(project_params)
      redirect_to @project, flash: {notice: "Project has been updated"}
    else
      flash.now[:alert] = "Project failed to update"
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path, flash: { notice: "Project has been deleted" }
    else
      flash.now[:alert] = "Project failed to delete"
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
