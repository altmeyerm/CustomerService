class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    render json: @customers, status: 200
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    render json: @customer, status: 200
  end

  # GET /customers/new
  #def new
  #  @customer = Customer.new
  #  render json: @customer, status: 
  #end

  # GET /customers/1/edit
  #def edit
  #end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.json { render :show, status: :created, location: @customer }
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.json { render :show, status: :ok, location: @customer }
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
       format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:firstname, :lastname, :age)
    end
end
