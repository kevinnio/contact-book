class ContactsController < ApplicationController
  before_action :load_contacts, only: :index
  before_action :load_contact, only: %w[edit update destroy]

  def index; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.create!(contact_params)
  end

  def edit; end

  def update
    @contact.update(contact_params)
  end

  def destroy
    @contact.delete
  end

  protected

  def load_contacts
    @contacts = current_user.contacts.order(:firstname, :lastname)
  end

  def load_contact
    @contact = current_user.contacts.find(params[:id])
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
