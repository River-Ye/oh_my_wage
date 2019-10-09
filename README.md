# README

1. bundle
2. rails db:drop
   (換 postgresql 後若 rails db:drop 會噴錯誤訊息，請到 psql 介面 下手動刪除，方法如下方所寫)
3. rails db:create
4. rails db:migrate
5. rails db:seed
   (一次產生 admin\*150 、 staff\*150 、 student\*150 、 各部門 關聯假資料 、 學生薪資\*300)
6. rails c
7. User.all
8. 用 db:seed 產生的資料來登入，admin 為管理者，t 為老師， s 為學生
9. 參考下方 HEROKU 設定

## Factorybot

    * 使用 rails c >> User.admin / User.staff / User.student 即可看到不同 role 的帳戶資料。

## postgresql

```sql
終端機指令
$ psql    # 進入 postgresql 操作介面
$ \l      # show 本地端電腦的所有 postgresql 資料庫
$ exit    # 離開
$ \q      # 離開
$ psql --version    # 查詢版本


以下指令要在 $ psql 介面下才能操作
刪除前，請先確認 rails s 已關閉 (避免資料還再存取，導致刪除失敗)
# drop database 要刪除的資料庫名稱;    # 一定要加;

ex:
# drop database oh_my_wage_development;
# drop database oh_my_wage_test;
```

## HEROKU 資料庫操作

```sql
查詢資料庫
$ heroku addons

查詢版本
$ heroku run rake db:version

即時看 Log 訊息
$ heroku logs -t

刪除 Heroku 專案上既有資料庫步驟：
1. HEROKU 網站 → Dashboard → Resources → 點選「Add-ons」下方右邊的「Delete Add-on」
接著，依序於終端機輸入以下指令：
$ heroku addons:create heroku-postgresql:hobby-dev
$ heroku run rails db:migrate
$ heroku run rails db:seed
```

---

## HEROKU 設定

### 忘記密碼

將本地端的「application.yml.sample」 輸入 mailgun 提供的 Username、Default password 填寫後，檔名改成「application.yml」即可

- 可用 [mailgun](https://www.mailgun.com/) 服務，將「application.yml」中的「MAILGUN_USERNAME」、「MAILGUN_PASSWORD」欄位輸入 mailgun → Sending → Domains → 點選 Name 底下的序號 → SMTP → Username、Default password (密碼要特別留意別複製到 Manage SMTP credentials )
- mailgun 操作界面截圖如下：
  ![](https://i.imgur.com/icOLtzG.png)

### Google Map

將本地端的「application.yml.sample」輸入 Google API KEY 後，檔名改成「application.yml」即可

- 申請方式

1. 至 [Google Cloud Platform](https://console.cloud.google.com) 申請 Google API → 右上方「控制台」 → 選取專案 → 新增專案 → 輸入「專案名稱」，可忽略機構 → 建立 → 左邊 Nav bar 點選「API 和服務」 → 資訊主頁 → 搜尋「Maps JavaScript API」 → 啟用「Maps JavaScript API」 → 左邊 Nav bar 的「API 和服務」中的「憑證」 → 建立憑證 → API 金鑰 → 複製 API 金鑰至「application.yml」檔案中的「Google_API KEY」。
1. 接著點選左邊 Nav bar 點選「帳單」 → 連結至帳單帳戶 → 建立帳單帳戶 → 輸入信用卡號等資料 → 大功告成

**注意：沒輸入信用卡號等，服務並不會真的啟用喔。**

部署 HEROKU 後，終端機輸入：

```ruby=
figaro heroku:set -e production
```

![](https://i.imgur.com/9WGxbDG.png)

---

## Tool

[**Oh My Wage**](https://oh-my-wage.website/)

[**GitHub**](https://github.com/River-Ye/oh_my_wage/)

[**Quip**](https://riverye.quip.com/OcZAOAihsSC)

[**lucidchart (ERD)**](https://www.lucidchart.com/documents/edit/52440e0b-0748-4620-9b85-6fbf4642601b)

[**Wireframe**](https://whimsical.com/JgPoSu5DBGz4kNfxC9S99L)

[**Trello (票)**](https://trello.com/oh_my_wage)
