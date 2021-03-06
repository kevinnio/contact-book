class ContactsController < ApplicationController
  before_action :load_contact, only: %w[edit update destroy]

  def index
    @contacts = current_user.contacts.order(:firstname, :lastname)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.create(contact_params)
    if @contact.valid?
      flash[:notice] = "#{@contact.fullname} was saved."
      redirect_to contacts_path
    else
      render action: :new
    end
  end

  def edit; end

  def update
    @contact.update(contact_params)
    if @contact.valid?
      flash[:notice] = "#{@contact.fullname} was updated."
      redirect_to contacts_path
    else
      render action: :edit
    end
  end

  def destroy
    @contact.delete
    flash[:notice] = "#{@contact.fullname} was deleted."
    redirect_to contacts_path
  end

  protected

  def load_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(
      :picture,
      :firstname,
      :lastname,
      :telephone,
      :address
    )
  end
end
