# メソッドを定義する部分------------------------------

# 商品を表示
def disp_products(products)
  puts "がまがま水族館へようこそ！券売機で入場券を買ってね。"
  products.each.with_index(FIRST_PRODUCT_NUM) do |product,i|
    puts "#{i}.#{product[:name]} (#{product[:price]}円)"
  end
end

# 商品を選択
def choose_product(products)
  while true
    print "該当のチケット番号を選択 > "
    select_product_num = gets.to_i
    break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_product_num)
    puts "#{FIRST_PRODUCT_NUM}～#{LAST_PRODUCT_NUM}の番号を入力してください"
  end
  # (インデックスを調整して『選んだ商品』を定義)
  chosen_product_index = select_product_num - FIRST_PRODUCT_NUM
  products[chosen_product_index]
end

# 個数を決定
def decide_quantity(chosen_product)
  puts "#{chosen_product[:name]}ですね。入場券は何枚買いますか？"
  while true
    print "枚数を入力 > "
    quantity_of_product = gets.to_i
    break if quantity_of_product >= 1
    puts "1枚以上選択してください"
  end
  quantity_of_product
end

# 合計金額を計算する
def calculate_charges(chosen_product, quantity_of_product)
  total_price = chosen_product[:price] * quantity_of_product
  if quantity_of_product >= DISCOUNT_STANDARD_VALUE
    puts "#{DISCOUNT_STANDARD_VALUE}名以上来館されるため、#{(DISCOUNT_RATE*100).floor}%割引となります！"
    total_price *= AFTER_DISCOUNT_RATE
  end
  puts "合計金額は#{total_price.floor}円です。"
  puts "それでは当館でのお時間をお楽しみください。"
end



# 定数を設定。ここでの変更がコード全体に反映される
FIRST_PRODUCT_NUM = 31 # 表示する最初の商品番号(変更可)
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1 # 表示する最後の商品番号(変更不可)
DISCOUNT_STANDARD_VALUE = 2 # 割引きを適用する個数の基準値 (変更可)
DISCOUNT_RATE = 0.1 # 割引率(変更可)
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE # 割引後の本体価格の割合(変更不可)

