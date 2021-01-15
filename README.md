# 積ん読

## 「積ん読」は読書スケジュール管理アプリです。
-カンバンボード形式でリストとカードでスケジュール管理ができます。
-url 

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
- belongs_to :list
