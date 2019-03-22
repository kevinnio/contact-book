class ContactsController < ApplicationController
  before_action :load_contacts, only: :index

  def index; end

  protected

  def load_contacts
    @contacts = Contact.order(:firstname, :lastname)
  end
end
