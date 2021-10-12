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