
require "./ticket.rb"
require "./Aquarium.rb"
require "./user.rb"


# 入場券1のデータ
ticket_params1 = [
  {name: "大人(高校生以上)", price: 1350},
  {name: "小・中学生", price: 600},
  {name: "幼児(4歳以上)", price:300},
  {name: "65歳以上)", price:1200}
]

# 水族館の開園
aquarium1 = Aquarium.new(ticket_params1)


# 追加入場券のデータ
adding_ticket_params1 = [
  {name: "カップル割", price:2400},
  {name: "年間パスポート", price:2000}
]

# 商品を登録
aquarium1.register_ticket(adding_ticket_params1)

# お客さんの来園
user = User.new

# 入場券を表示
aquarium1.disp_tickets

# 入場券を選択
user.choose_ticket(aquarium1.tickets)

# 枚数を質問
aquarium1.ask_quantity(user.chosen_ticket)

# 枚数を決定
user.decide_quantity

# 合計金額を計算(実引数をuserというインスタンスに設定)
aquarium1.calculate_charges(user)