class ContactsController < ApplicationController
  before_action :load_contacts, only: :index
  before_action :load_contact, only: [:edit, :update]

  def index; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create!(contact_params)
  end

  def edit; end

  def update
    @contact.update(contact_params)
  end

  protected

  def load_contacts
    @contacts = Contact.order(:firstname, :lastname)
  end

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(
      :firstname,
      :lastname,
      :telephone,
      :address
    )
  end
end
