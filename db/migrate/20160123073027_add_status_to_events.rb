class AddStatusToEvents < ActiveRecord::Migration
  def change
      add_column :events, :status, :string
      #下 rake db:migrate
      #至events 表格,新增欄位名稱為status欄位型態為string
  end
end
