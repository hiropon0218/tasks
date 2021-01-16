# 積ん読

## 「積ん読」は読書スケジュール管理アプリです。
カンバンボード形式でリストとカードでスケジュール管理ができます。ボードの中に任意の本のタイトルを記入したカードを作成し、それを移動させて読書進捗を可視化します。
### 企業様用guestアカウント
url: https://tsundoku32509.herokuapp.com/users/sign_in
- お名前: guest
- メールアドレス: guest@aaa
- パスワード: 123abc

![image](https://user-images.githubusercontent.com/74945462/104792374-8379fc80-57e1-11eb-8387-ffbbd11c08f4.png)



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
