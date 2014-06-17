class ContactsController < ApplicationController
  before_action :set_agent, only: [:index, :new, :create, :edit]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = @agent.contacts.all
  end

  def show
  end

  def new
    @contact = @agent.contacts.build
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.agent_id = params[:agent_id]

    respond_to do |format|
      if @contact.save
        @contact.set_default_contact
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        @contact.set_default_contact
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to agent_contacts_path(agent_id: @contact.agent_id), notice: 'Contact was successfully destroyed.' }
    end
  end

  private
    def set_agent
      @agent = Agent.find(params[:agent_id])  
    end  

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:agent_id, :contact_detail, :default)
    end
end
