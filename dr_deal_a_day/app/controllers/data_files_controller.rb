class DataFilesController < ApplicationController
  before_action :authorize

  def index
    @total = Order.total
    @orders = Order.all
  end

  def new
    @data_file = DataFile.new
  end

  def create
    total = DataFile.import params[ :file ]

    redirect_to root_path, notice: 
      "Successfullay uploaded the file with a total of $" + 
      "%.2f" % total + 
      " in new purchases."
  end
end
