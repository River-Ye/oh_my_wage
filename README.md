# Oh My Wage
## 霍格華茲薪資計算系統
<p>你是否在學校打工有薪資計算的麻煩？</p>
<p>傳統的Excel登錄讓你覺得困擾？</p>
<p>別擔心使用霍格華茲薪資計算系統</p>
<p>全部一次解決！</p>

# 目錄
   * [專案目的](#專案目的)
   * [產品故事](#產品故事)
   * [UserStory](#UserStory)
   * [專案初始化](#專案初始化)
   * [Authors](#Authors)

# 專案目的
<p>解決學生在校內打工薪資計算問題，</p>
<p>提供老師與學生計算薪資與查詢薪資的平台。</p>
<p>傳統Excel、打卡薪資計算的不便性，</p>
<p>透過Oh My Ｗage 就能達到即時登錄及查詢薪資。</p>

# 產品故事
<p>有天鄧不利Ｘ校長，拜託我們Oh My Wage團隊，</p>
<p>設計開發一套，符合霍格華茲學院的薪資系統，</p>
<p>希望我們這套薪資系統，來解決霍格華茲學院的薪資計算問題！</p>

# User Story

## 使用者相關
   目前僅提供霍格華茲學院職員、學生使用。
   主要分為三種使用者：系統管理者、職員、學生。
   
### 系統管理者(Admin)
    管理者為最高權限，可以編輯、刪除現有的管理者、職員及學生資料，另外也可以新增職員及學生的基本資料，並建立個人基本資料。
    
### 職員(Staff) 
    職員為次高權限，可以新增、刪除、查詢學生薪資工時紀錄及資料，也可以將學生剔除或新增在部門內打工，最後將學生薪資工時紀錄匯出PDF列印。
    如有任何問題，可以在問題反映提出問題回報。

### 學生(Student)
    學生為最低權限，僅提供查詢當月薪資，及歷史薪資資料查詢，提供折線圖使學生快速了解自己的當月工時，如有任何問題可以在問題回報提出，反應給教職員。

### 帳號(Account)
    目前僅提供管理者150名帳號、教職員150名帳號、學生150名帳號，帳號後面 _____＠oh-my-wage。
    1. 管理者帳號：a001~a150 ＋ ＠oh-my-wage。
    2. 職員帳號：  t001~t150 ＋ ＠oh-my-wage。
    3. 學生帳號：  s001~S150 ＋ ＠oh-my-wage。

# 專案初始化

1. bundle
2. rails db:drop
   (換 postgresql 後若 rails db:drop 會噴錯誤訊息，請到 [Postgresql](#Postgresql)介面 下手動刪除，方法如下方所寫)
3. rails db:create
4. rails db:migrate
5. rails db:seed
   (一次產生 admin\*150 、 staff\*150 、 student\*150 、 各部門 關聯假資料 、 學生薪資\*300)
6. rails c
7. User.all
8. 用 db:seed 產生的資料來登入，a 為管理者，t 為老師， s 為學生
9. 參考下方 HEROKU 設定

## Factorybot

    * 使用 rails c >> User.admin / User.staff / User.student 即可看到不同 role 的帳戶資料。

## Postgresql

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


## Authors
[River Yeh](https://github.com/River-Ye)
[Axel Chen](https://github.com/ZarekChung)
[Joan Liao](https://github.com/joanliao0525)
[Patrick Liu](https://github.com/Patrick0906)

