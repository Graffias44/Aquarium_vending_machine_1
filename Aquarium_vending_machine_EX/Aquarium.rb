
class Aquarium
  attr_reader :tickets
  def initialize(ticket_params)
    @tickets = []
    register_ticket(ticket_params)
  end

 # 新入場券を登録
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


 # 合計金額を計算
  def calculate_charges(user)
    total_price = user.chosen_ticket.price * user.quantity_of_ticket
    if user.quantity_of_ticket >= 2
      puts "2名以上の来館のため、10%割引となります!"
      total_price *= 0.9
    end
    puts "合計金額は#{total_price.floor}円です。"
    puts "それでは当館でのお時間をお楽しみください。"
  end
end