# README

1. clone or fetch 專案後
2. bundle
3. rails db:drop (換 postgresql 後若 rails db:drop 會噴錯誤訊息，請到 psql 介面下手動刪除，方法如下方所寫)
4. rails db:create
5. rails db:migrate
6. rails db:seed (一次產生 admin\*150 、 staff\*150 、 student\*150 、 各部門關聯假資料 、 學生薪資\*300)
7. rails c
8. User.all
9. 用 db:seed 產生的資料來登入，admin 為管理者，t 為老師， s 為學生

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

## gmap heroku
 
將本地端的「application.yml.sample」 裡面google金鑰資料填寫後，副檔名改成 .yml 即可
終端機打
figaro heroku:set -e production


## HEROKU

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


## 忘記密碼
將本地端的「application.yml.sample」 裡面mailgun帳密填寫後，副檔名改成 .yml 即可

---

## Tool

[**Oh My Wage**](https://oh-my-wage.website/)

[**GitHub**](https://github.com/River-Ye/oh_my_wage/)

[**Quip**](https://riverye.quip.com/OcZAOAihsSC)

[**lucidchart (ERD)**](https://www.lucidchart.com/documents/edit/52440e0b-0748-4620-9b85-6fbf4642601b)

[**Wireframe**](https://whimsical.com/JgPoSu5DBGz4kNfxC9S99L)

[**Trello (票)**](https://trello.com/oh_my_wage)
