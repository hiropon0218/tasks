# 積ん読

## 「積ん読」は読書スケジュール管理アプリです。
カンバンボード形式でリストとカードでスケジュール管理ができます。リストの中に任意の本のタイトルを記入したカードを作成し、それを移動させて読書進捗を可視化します。
### 企業様用guestアカウント
url: https://tsundoku32509.herokuapp.com/users/sign_in
- お名前: guest
- メールアドレス: guest@aaa
- パスワード: 123abc

## 使い方
### 新規ユーザー登録後は自動的に以下の3つのボードが生成されます。
このリストは任意で消したりタイトルの変更も可能です。
![image](https://user-images.githubusercontent.com/74945462/104792374-8379fc80-57e1-11eb-8387-ffbbd11c08f4.png)

### 本を追加
リストの中の”本を追加”をクリックすると以下の画面に遷移し、内容を入力します。
タイトル、予定の日付、メモを記入します。(タイトルのみ必須)
![image](https://user-images.githubusercontent.com/74945462/104792768-f59f1100-57e2-11eb-9202-a22c144441fa.png)

このようにリストに追加されます。
![image](https://user-images.githubusercontent.com/74945462/104793122-7d394f80-57e4-11eb-9860-f97f52acfc4c.png)

### リスト間での本の移動
読書状況に応じて本のカードを各リストに移動します。
![image](https://gyazo.com/740a7c5e4c245ae3c2d5c5f1249be9d4/raw)

### 不要なリストの削除
![image](https://gyazo.com/38f0a555fe763e5d9773b20db23feeb6/raw)

### ドラッグアンドドロップを用いたリストの移動
画面更新後も位置は保持されます
![image](https://gyazo.com/719cf5c7ba1c0c5e57648ebb8c6b20a9/raw)



# テーブル設計

## usersテーブル
| Column             | Type     | Option              |
| ------------------ | -------- | ------------------- |
| name               | string   | null: false         |
| email              | string   | null: false, unique |
| encrypted_password | string   | null: false         |

### Association
- has_many :lists
- has_many :cards

## listsテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :cards

## cardsテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| memo             | text       |                                |
| date             | date       |                                |
| list             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :list
