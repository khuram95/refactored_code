class GildedRose
  def initialize(items)
    @items = items
    @maximum_quality = 50
    @minimum_quality = 0
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        item.quality += 1 if item.quality < @maximum_quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes_quality(item)
      when 'Conjured Mana Cake'
        item.quality-2 < @minimum_quality ? item.quality = @minimum_quality : item.quality-=2
      end
      if item.sell_in == 0
        expired(item)
        next
      end
      update_sell_in(item)
    end
  end

  def update_backstage_passes_quality(item)
    case item.sell_in
    when 6..10
      item.quality += 2
    when 1..5
      item.quality += 3
    when 0
      item.quality = @minimum_quality
    end
  end

  def update_sell_in(item)
    item.sell_in-=1 if item.sell_in > 0 and item.name != "Sulfuras, Hand of Ragnaros"
  end

  def expired(item)
    return if item.quality < @minimum_quality
    case item.name
    when 'Aged Brie'
      item.quality-1 < @minimum_quality ? item.quality = @minimum_quality : item.quality-=1
    when 'Conjured Mana Cake'
      item.quality-2 < @minimum_quality ? item.quality = @minimum_quality : item.quality-=2
    end
  end
 end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
