class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new

    @sale.client = Client.new 

    #@sale.saleDetails << SaleDetail.new(:product_id => 1, :preciounitario=>100, :cantidad => 1, :importe => 100)
    #@sale.saleDetails << SaleDetail.new(:product_id => 4, :preciounitario=>234, :cantidad => 2, :importe => 468)

  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create

   #strong parameters >> http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
   #se habilito strong parameters en el modelo
    @sale = Sale.new(sale_params)

    client= Client.new(client_params)
    
    if @sale.client_id.nil?
       @sale.client = client 
    else
      @sale.client.nombre = client.nombre
      @sale.client.direccion = client.direccion
    end 

    puts "Datos recibidos de la nueva venta"

    puts"Cliente>>" + @sale.client_id.to_s + @sale.client.nombre
    puts "productos recibidos"
    
    @sale.detailSales.each do |item|
       puts "id: " + item.book_id.to_s + ", p. u: " + item.precio.to_s + ", cantidad: " +  item.cantidad.to_s + ", descuento: " + item.descuento.to_s + ", total:" + item.total.to_s
      end 
      #puts params [:details].to_s
    #@sale.sale.detailsale.each do |item|
    #params [:detail].each do|item|
      #puts "id:" + item.product_id + ", p. u:"
      #+ item.preciounitario + ", cantidad: "
     # + item.cantidad + ", importe:" + item.importe
    #end#puts "la venta se a procesado..."#format.html {redirect_to:new}


    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }

      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:isbn])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      # dice que paramentros quiere 
      # se pone todos los datos que queremos del cliente 
      #poner lo de los detalles de venta 
      params.require(:sale).permit(:client_id, :detailSales_attributes => [:book_id, :precio, :cantidad, :total] )
    end
        def client_params
      # dice que paramentros quiere 
      # se pone todos los datos que queremos del cliente 
      #poner lo de los detalles de venta 
      params.require(:client).permit(:id, :Rfc, :nombre, :direccion, :telefono, :email)
    end

       #def detail_sales_params
      # dice que paramentros quiere 
      # se pone todos los datos que queremos del cliente 
      #poner lo de los detalles de venta 
      #arams.require(:sale[:detail_sales]).permit(:book_id, :fecha_venta)
   #end
end
