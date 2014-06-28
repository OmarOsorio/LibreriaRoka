class DetailOrdersController < ApplicationController
  before_action :set_detail_order, only: [:show, :edit, :update, :destroy]

  # GET /detail_orders
  # GET /detail_orders.json
  def index
    @detail_orders = DetailOrder.all
  end

  # GET /detail_orders/1
  # GET /detail_orders/1.json
  def show
  end

  # GET /detail_orders/new
  def new
    @detail_order = DetailOrder.new
  end

  # GET /detail_orders/1/edit
  def edit
  end

  # POST /detail_orders
  # POST /detail_orders.json
  def create
    @detail_order = DetailOrder.new(detail_order_params)

    respond_to do |format|
      if @detail_order.save
        format.html { redirect_to @detail_order, notice: 'Detail order was successfully created.' }
        format.json { render :show, status: :created, location: @detail_order }
      else
        format.html { render :new }
        format.json { render json: @detail_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_orders/1
  # PATCH/PUT /detail_orders/1.json
  def update
    respond_to do |format|
      if @detail_order.update(detail_order_params)
        format.html { redirect_to @detail_order, notice: 'Detail order was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_order }
      else
        format.html { render :edit }
        format.json { render json: @detail_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_orders/1
  # DELETE /detail_orders/1.json
  def destroy
    @detail_order.destroy
    respond_to do |format|
      format.html { redirect_to detail_orders_url, notice: 'Detail order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_order
      @detail_order = DetailOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_order_params
      params.require(:detail_order).permit(:order_id, :book_id, :cantidad)
    end
end
