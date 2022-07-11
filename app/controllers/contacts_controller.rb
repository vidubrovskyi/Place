class ContactsController < ApplicationController

  before_action :set_contact, only: %i[show destroy]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, status: :see_other
  end

  private

  def contact_params
    params.require(:contact).permit(:contact, :email, :body)
  end

  def set_contact
    @contact = find(params[:id])
  end
end
