# README

1. clone or fetch 專案後
2. bundle
3. rails db:drop
4. rails db:create
5. rails db:migrate
6. rails db:seed (一次產生 admin*1 、 staff*20 、 student\*80 、 各部門關聯假資料)
7. rails c
8. User.all
9. 用 db:seed 產生的資料來登入，admin 為管理者，t 為老師， s 為學生

## Factorybot

    * 使用 rails db:seed 即可產生假資料，admin 帳戶只能生成一次，若要再生成其他 admin 帳戶須將 email 變更後才能生成。
    * 使用 rails c >> User.admin / User.staff / User.student 即可看到不同 role 的帳戶資料。

---

## Tool

[**GitHub**](https://github.com/River-Ye/oh_my_wage/)

[**Quip**](https://riverye.quip.com/OcZAOAihsSC)

[**lucidchart (ERD)**](https://www.lucidchart.com/documents/edit/52440e0b-0748-4620-9b85-6fbf4642601b)

[**Wireframe**](https://whimsical.com/JgPoSu5DBGz4kNfxC9S99L)

[**Trello (票)**](https://trello.com/oh_my_wage)
