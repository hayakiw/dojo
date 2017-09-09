class CreateWorkingReportDays < ActiveRecord::Migration[5.0]
  def change
    create_table :working_report_days do |t|
      # アカウントID
      t.integer     :account_id
      # 日付
      t.date        :date
      # 日報内容
      t.text        :text
      # 備考
      t.text        :note

      t.timestamps
    end
  end
end
