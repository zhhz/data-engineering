class MerchantFilesController < ApplicationController
  before_action :merchant_files

  def new
    @merchant_file = MerchantFile.new
  end

  def create
    mf = merchant_file
    flash[:notice] = mf.original_filename
    @merchant_file = MerchantFile.new(name: mf.original_filename)
    @merchant_file.save

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
