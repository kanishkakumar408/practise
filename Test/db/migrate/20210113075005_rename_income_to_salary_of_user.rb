class RenameIncomeToSalaryOfUser < ActiveRecord::Migration[6.0]
  def change
  	rename_column :users, :Income, :salary
  end
end
