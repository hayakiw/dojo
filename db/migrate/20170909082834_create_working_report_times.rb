class CreateWorkingReportTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :working_report_times do |t|
      # アカウントID
      t.integer   :account_id
      # 日付
      t.date      :date
      # 開始日時
      t.time      :start_time
      # 終了日時
      t.time      :end_time
      # 休憩
      t.time      :rest_time
      # 顧客ID
      t.integer   :customer_id
      # 顧客プロジェクID
      t.integer   :customer_project_id
      # 作業内容ID
      t.integer   :customer_project_work_id
      # 作業場所
      t.string    :working_place,   limit:128
      # 内容
      t.text      :working_text
      # 作業時間
      t.time      :working_time
      # 時間外作業時間
      t.time      :over_working_time

      t.timestamps
    end
  end
end
