
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
  # (1)クラス外から参照可能にする
  attr_reader :tickets
  def initialize(ticket_params)
    @tickets = []
    register_ticket(ticket_params)
  end

 # 新入場券を登録するメソッドを定義
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
end

class User
  # 『商品を選択する』メソッド
  def choose_ticket(tickets)
    while true
      print"該当のチケット番号を選択 > "
      select_ticket_id = gets.to_i
      @chosen_ticket = tickets.find{|ticket| ticket.id == select_ticket_id}
      break if !@chosen_ticket.nil?
      puts "#{tickets.first.id}から#{tickets.last.id}の番号を選択してください"
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


