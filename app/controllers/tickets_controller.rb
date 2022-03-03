class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save
      redirect_to [@project, @ticket], flash: { notice: "Ticket created successfully"}
    else
      flash.now[:alert] = "Ticket not created"
      render :new
    end
  end

  def show
    #
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
