class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all

    # 表示用書式に編集
    @stocks.each do |stock|
      stock.code = stock.code.floor
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    # respond_to:1つのアクションから複数のフォーマットで返す
    respond_to do |format|
      if @stock.update(stock_params)
      
        # 写真のアップロードと保存
        if params[:stock].has_key? :picture
          @stock.picture = params[:stock]["picture"].read
          @stock.filename = params[:stock]["picture"].original_filename
          @stock.save
        end

        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 写真の画像表示
  def send_img
    @stock = set_stock

    if @stock.picture != nil
      send_data @stock.picture, type: "image/jpeg", disposition: :inline
    end
  end

  # メンバーメソッド
private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # stockモデルに関係のある変数のみを記載する。直接テーブルにUpdate可能となる。
    def stock_params
      params.require(:stock).permit(:name, :code, :buydate, :buynum, :buyprice, :selldate, :sellnum, :sellprice, :note, :judge, :profitloss)
    end
end
