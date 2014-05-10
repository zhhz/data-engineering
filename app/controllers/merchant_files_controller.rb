class MerchantFilesController < ApplicationController
  http_basic_authenticate_with name: "lscc", password: "lscc", except: [:new]

  before_action :merchant_files

  def new
    @merchant_file = MerchantFile.new
  end

  def create
    mf = merchant_file

    total = MerchantFile.process_file mf.tempfile
    @merchant_file = MerchantFile.new(name: mf.original_filename, total: total)
    @merchant_file.save
    flash[:info] = "The total amount gross revenue represented by the uploaded file was #{number_to_currency(total)}."

    render :new
  end

  private
    def merchant_file
      params[:merchant_file][:file]
    end

    def merchant_files
      @merchant_files = MerchantFile.order(created_at: :desc)
    end
end
