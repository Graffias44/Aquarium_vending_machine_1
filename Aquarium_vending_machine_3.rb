
class Ticket
  attr_reader :id, :name, :price
  @@count = 27
  def initialize(ticket_params)
    @id = @@count += 1
    @name = ticket_params[:name]
    @price = ticket_params[:price]
  end
end

class Aquarium
  attr_reader :tickets
  # 定数を設定
  DISCOUNT_STANDARD_VALUE = 2 #割引を適用する枚数の基準値(変更可)
  DISCOUNT_RATE = 0.1 #割引率(変更可)
  AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE # 割引後の本体価格の割合(変更不可)

  def initialize(ticket_params)
    @tickets = []
    register_ticket(ticket_params)
  end

 # 入場券を登録
 def register_ticket(ticket_params)
    ticket_params.each do |param|
      @tickets << Ticket.new(param)
    end
 end

  # 券売機を表示
  def disp_tickets
    puts "がまがま水族館へようこそ！券売機で入場券を買ってね。"
    @tickets.each do |ticket|
      puts "#{ticket.id}.#{ticket.name}""(¥#{ticket.price})"
    end
  end


 # 枚数を質問
  def ask_quantity(chosen_ticket)
    puts "#{chosen_ticket.name}ですね。何枚購入されますか？"
  end


 # (2)合計金額を計算(定数を使った書き方に変更)
  def calculate_charges(user)
    total_price = user.chosen_ticket.price * user.quantity_of_ticket
    if user.quantity_of_ticket >= DISCOUNT_STANDARD_VALUE
      puts "#{DISCOUT_STANDARD_VALUE}名以上の来館のため、#{DISCOUNT_RATE*100}%割引となります!"
      total_price *= AFTER_DISCOUNT_RATE
    end
    puts "合計金額は#{total_price.floor}円です。"
    puts "それでは当館でのお時間をお楽しみください。"
  end
end

class User
  attr_reader :chosen_ticket, :quantity_of_ticket

  # 入場券を選択
  def choose_ticket(tickets)
    while true
      print"該当のチケット番号を選択 > "
      select_ticket_id = gets.to_i
      @chosen_ticket = tickets.find{|ticket| ticket.id == select_ticket_id}
      break if !@chosen_ticket.nil?
      puts "#{tickets.first.id}から#{tickets.last.id}の番号を選択してください"
    end
  end

  # 枚数を決定
  def decide_quantity
    while true
      print "枚数を入力"
      @quantity_of_ticket = gets.to_i
      break if @quantity_of_ticket >= 1
      puts "1枚以上選択して下さい。"
    end
  end
end


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



