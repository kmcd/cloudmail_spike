class EmailsController < ApplicationController
  def index
    @emails = Email.threads
  end
  
  def show
    @email = Email.find params[:id]
  end
end
