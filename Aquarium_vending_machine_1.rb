# 条件分岐、ハッシュ、配列や繰り返し処理を利用

# 商品データ
products = [
  {name: "大人(高校生以上)", price: 1350},
  {name: "小・中学生", price: 600},
  {name: "幼児(4歳以上)", price:300},
  {name: "65歳以上)", price:1200}
]

# 定数を設定。ここでの変更がコード全体に反映される
FIRST_PRODUCT_NUM = 31 # 表示する最初の番号(変更可)
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1 # 表示する最後の商品番号(変更不可)
DISCOUNT_STANDARD_VALUE = 2 # 割引きを適用する個数の基準値(変更可)
DISCOUNT_RATE = 0.1 # 割引率(変更可)
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE # 割引後の本体価格の割合(変更不可)

# 商品を表示
puts "がまがま水族館へようこそ！券売機で入場券を買ってね。"
products.each.with_index(FIRST_PRODUCT_NUM) do |product,i|
  puts "#{i}.#{product[:name]} (#{product [:price]}円)"
end

# 商品を選択
while true
  print "商品の番号を選択 > "
  select_product_num = gets.to_i
  break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_product_num)
  puts "#{FIRST_PRODUCT_NUM}～#{LAST_PRODUCT_NUM}の番号を入力してください。"
end

# (インデックスを調整して『選んだ商品』を定義)
chosen_product_index = select_product_num - FIRST_PRODUCT_NUM
chosen_product = products[chosen_product_index]

# 個数を決定
puts "#{chosen_product[:name]}ですね。入場券は何枚買いますか？"
while true
  print "枚数を入力 > "
  quantity_of_product = gets.to_i
  break if quantity_of_product >= 1
  puts "1枚以上選んでください"
end

#合計金額を計算
total_price = chosen_product[:price] * quantity_of_product
if quantity_of_product >= DISCOUNT_STANDARD_VALUE
  puts "#{DISCOUNT_STANDARD_VALUE}名以上の来館のため、#{(DISCOUNT_RATE * 100).floor}%割引となります!"
  total_price *= AFTER_DISCOUNT_RATE
end
puts "合計金額は#{total_price.floor}円です。"
puts "それでは当館で良い時間をお過ごし下さい。"