require "date"
class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        chunk.each do |row|
            Diamond.create(:date => row[:d1], :weight => row[:d5], :weight2 => row[:d5], :color => row[:d6], :clar => row[:d10], :length => row[:d11], :width => row[:d12],
                     :depth => row[:d13], :cut_grade => row[:d15], :rapnet_list_price => row[:d17], :rapnet_discount => row[:d18], :price_per_carat => row[:d19], 
                    :polish => row[:d27], :symmetry => row[:d28], :fluorescen => row[:d29], :certificate_id => row[:d38], :end_price => row[:d49],
                     :shape => row[:d4], :depth_percent => row[:d20], :table_percent => row[:d21], :girdle_thin => row[:d22], :girdle_thick => row[:d23])
        end
    end
    
end

