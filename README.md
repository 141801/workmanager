# 機能要件
- 管理者
  - 管理者がログインが必要です。
  - 管理者が、従業員の一覧が見えます。
　- 管理者が、従業員の削除ができます(打刻履歴も削除されます)。
　- 管理者が、従業員の任意な作業時間一覧が見えます
　- 管理者が、従業員の打刻記録を変更、削除ができます。

- 従業員
  - 従業員が新規登録できます。
  - 従業員が個人情報変更できます（name,password）
  - 従業員が自分過去の打刻履歴のみ見えます
  - 従業員は「勤務開始」を押して「勤務終了」ボタンを押すと、その日の勤務時間を知ることができます。
    - 「勤務開始」二回以上を押すと、「勤務終了」が押さない限り、最後の「勤務開始」操作時間に準じます
    - 「勤務終了」二回以上を押すと、「勤務開始」が押さない限り、最後の「勤務終了」操作時間に準じます
    
- セキュリティー
  - 情報漏洩の防止策として、全てのユーザのパスワードを暗号化で保存
  - ユーザに対して入力値検証

#db table
* users(uid,name,email,isadmin,password)
* management(ontime,offtime,uid)
