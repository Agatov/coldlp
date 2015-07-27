class Admin::ContactsController < AdminController
  def index
    @contacts = Contact.order('id desc')
  end

  def show
    @contact = Contact.find params[:id]
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params

    if @contact.save
      redirect_to admin_contacts_path
    end
  end

  def edit
    @contact = Contact.find params[:id]
  end

  def update
    @contact = Contact.find params[:id]

    if @contact.update_attributes contact_params
      redirect_to admin_contacts_path
    end
  end

  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy
    redirect_to admin_contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit!
  end
end