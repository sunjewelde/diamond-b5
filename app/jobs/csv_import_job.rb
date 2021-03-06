require "date"
class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        # @diamond_latest = Diamond.maximum(:date)
        # if chunk[:date] != diamond_latest
        # end
        
        chunk.each do |row|
            Diamond.create(:date => row[:date], :weight => row[:weight], :weight2 => row[:weight2], :color => row[:color], :clar => row[:clar], :length => row[:length], :width => row[:width],
                     :depth => row[:depth], :cut_grade => row[:cut_grade], :rapnet_list_price => row[:rapnet_list_price], :rapnet_discount => row[:rapnet_discount], :price_per_carat => row[:price_per_carat], 
                    :polish => row[:polish], :symmetry => row[:symmetry], :fluorescen => row[:fluorescen], :certificate_id => row[:certificate_id], :end_price => row[:end_price],
                     :shape => row[:shape], :depth_percent => row[:depth_percent], :table_percent => row[:table_percent], :girdle_thin => row[:girdle_thin], :girdle_thick => row[:girdle_thick])
            
            
            # d_color = row[:color]
            # d_depth = row[:depth]
            # d_length = row[:length]
            # d_width = row[:width]
            
            # if d_color != nil and d_depth != 0 and d_length != 0 and d_width != 0
            # else
            #     Diamond.create(:date => row[:date], :weight => row[:weight], :weight2 => row[:weight2], :color => row[:color], :clar => row[:clar], :length => row[:length], :width => row[:width],
            #          :depth => row[:depth], :cut_grade => row[:cut_grade], :rapnet_list_price => row[:rapnet_list_price], :rapnet_discount => row[:rapnet_discount], :price_per_carat => row[:price_per_carat], 
            #         :polish => row[:polish], :symmetry => row[:symmetry], :fluorescen => row[:fluorescen], :certificate_id => row[:certificate_id], :end_price => row[:end_price],
            #          :shape => row[:shape], :depth_percent => row[:depth_percent], :table_percent => row[:table_percent], :girdle_thin => row[:girdle_thin], :girdle_thick => row[:girdle_thick])
            # end
            
        end
        # MyMailer.upload_confirmation_csv.deliver
    end
    
end

