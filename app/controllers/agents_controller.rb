class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def index
    @agents = Agent.all
  end

  def show
    @agent = Agent.find(params[:id])
    @contacts = @agent.contacts
  end

  def new
    @agent = Agent.new
  end

  def edit
  end

  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        format.html { redirect_to @agent, notice: 'Agent was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:first_name, :last_name)
    end
end
