class MerchantFilesController < ApplicationController
  before_action :merchant_files

  def new
    @merchant_file = MerchantFile.new
  end

  def create
    mf = merchant_file

    total = MerchantFile.process_file mf.tempfile
    @merchant_file = MerchantFile.new(name: mf.original_filename, total: total)
    @merchant_file.save
    flash[:notice] = total

    render :new
  end

  private
    def merchant_file
      params[:merchant_file][:file]
    end

    def merchant_files
      @merchant_files = MerchantFile.all
    end
end
