class LoansController < ApplicationController
  def edit
    @loans = Loan.all
    @loans.each do |loan|
      loan.transactions.build
    end
  end

  def update
    @loans = Loan.all
    if @loans.update(loans_params)

    else
      render :edit
    end
  end

  private
  def loans_params
    params.require(:loans).permit(
        transactions_attributes: [:id, :amount]
    )
  end
end