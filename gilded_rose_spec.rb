require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
 describe '#update_quality' do
   it 'does not change the name' do
     items = [Item.new('foo', 0, 0)]
     GildedRose.new(items).update_quality()
     expect(items[0].name).to eq 'fixme'
   end
   it 'quality should not be increased/decreased' do
     items = [Item.new('Sulfuras, Hand of Ragnaros',0,80)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq 80
   end
   it 'quality should be increased' do
     items = [Item.new('Backstage passes to a TAFKAL80ETC concert',3,80)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq 83
   end
   it 'quality should be zero' do
     items = [Item.new('Backstage passes to a TAFKAL80ETC concert',0,80)]
     GildedRose.new(items).update_quality()
     expect(items[0].quality).to eq 0
   end
 end
end