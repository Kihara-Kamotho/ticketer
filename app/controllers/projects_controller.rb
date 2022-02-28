class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, flash: {notice: "project created successfully"}
    else
      render :new, flash: {alert: "project not created"}
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
