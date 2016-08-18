require "date"
class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        chunk.each do |row|
            Diamond.create(:date => row[:date], :weight => row[:weight], :weight2 => row[:weight2], :color => row[:color], :clar => row[:clar], :length => row[length], :width => row[:width],
                     :depth => row[:depth], :cut_grade => row[:cut_grade], :rapnet_list_price => row[:rapnet_list_price], :rapnet_discount => row[:rapnet_discount], :price_per_carat => row[:price_per_carat], 
                    :polish => row[:polish], :symmetry => row[:symmetry], :fluorescen => row[:fluorescen], :certificate_id => row[:certificate_id], :end_price => row[:end_price],
                     :shape => row[:shape], :depth_percent => row[:depth_percent], :table_percent => row[:table_percent], :girdle_thin => row[:girdle_thin], :girdle_thick => row[:girdle_thick])
        end
    end
    
end

