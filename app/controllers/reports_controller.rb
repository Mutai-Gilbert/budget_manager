class ReportsController < ApplicationController
  before_action :generate_report_data, only: [:create]

  def create
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=budget_report_#{Date.today.strftime('%Y%m%d')}.xlsx"
        render template: 'reports/create'
      end
    end
  end

  private

  def generate_report_data
    @categories = current_user.categories.includes(:transaction_entries)
    @total_budget = @categories.sum { |cat| cat.transaction_entries.sum(:amount) }
    @monthly_transactions = TransactionEntry.where(user: current_user, recurring: :monthly)
    @one_time_transactions = TransactionEntry.where(user: current_user, recurring: :one_time)
  end
end 