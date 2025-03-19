class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :generate_report_data, only: [:create]

  def create
    respond_to do |format|
      format.xlsx {
        Rails.logger.debug "Creating Excel report with #{@categories.count} categories"
        response.headers['Content-Disposition'] = "attachment; filename=budget_report_#{Date.today.strftime('%Y%m%d')}.xlsx"
        render xlsx: "create", filename: "budget_report.xlsx"
      }
    end
  end

  private

  def generate_report_data
    @categories = current_user.categories.includes(:transaction_entries)
    @total_budget = @categories.sum { |cat| cat.transaction_entries.sum(:amount) }
    @monthly_transactions = current_user.transaction_entries.monthly
    @one_time_transactions = current_user.transaction_entries.one_time
  end
end 