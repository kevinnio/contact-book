class ContactsController < ApplicationController
  before_action :load_contacts, only: :index

  def index; end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create!(contact_params)
  end

  protected

  def load_contacts
    @contacts = Contact.order(:firstname, :lastname)
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
