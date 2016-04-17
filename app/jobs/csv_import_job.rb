require "date"
class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        # Diamond.import(params[:file])
        # file = file.path if file.is_a?(File)
            # CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            # chunk.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            
    
            chunk.each do |hash|
                # hash.each do |row|
                    diamond = Diamond.new
                    
            #         # diamond.date = row["date"].values #csvの1列目を格納
                    diamond.weight = row["weight"].values rescue nil
                    diamond.color = row["color"].values rescue nil
                    diamond.clar = row["clarity"].values rescue nil
                    # diamond.length = row["measlength"].values rescue nil
            #         # diamond.width = row["measwidth"].values rescue nil
            #         # diamond.depth = row["measdepth"].values rescue nil
            #         # diamond.cut_grade = row["cutgrade"].values rescue nil
            #         # diamond.rapnet_list_price = row["rapnet_list_price"].values rescue nil
            #         # diamond.rapnet_discount = row["rapnet_discount"].values rescue nil
            #         # diamond.price_per_carat = row["price_per_carat"].values rescue nil
            #         # diamond.polish = row["polish"].values rescue nil
            #         # diamond.symmetry = row["symmetry"].values rescue nil
            #         # diamond.fluorescen = row["fluorescence_intensity"].values rescue nil
            #         # diamond.certificate_id = row["certificateid"].values rescue nil
            #         # diamond.end_price = row["usd"].values rescue nil
                    
                    #   diamond.date = hash.values_at(:date) rescue nil  #csvの1列目を格納
                    #   diamond.weight = hash.values_at(:weight) rescue nil
                    #   diamond.color = hash.values_at(:color) rescue nil
                    #   diamond.clar = hash.values_at(:clarity) rescue nil
            #         #   diamond.length = hash.values_at(:measlength) rescue nil
            #         #   diamond.width = hash.values_at(:measwidth) rescue nil
            #         #   diamond.depth = hash.values_at(:measdepth) rescue nil
            #         #   diamond.cut_grade = hash.values_at(:cutgrade) rescue nil
            #         #   diamond.rapnet_list_price = hash.values_at(:rapnet_list_price) rescue nil
            #         #   diamond.rapnet_discount = hash.values_at(:rapnet_discount) rescue nil
            #         #   diamond.price_per_carat = hash.values_at(:price_per_carat) rescue nil
            #         #   diamond.polish = hash.values_at(:polish) rescue nil
            #         #   diamond.symmetry = hash.values_at(:symmetry) rescue nil
            #         #   diamond.fluorescen = hash.values_at(:fluorescence_intensity) rescue nil
            #         #   diamond.certificate_id = hash.values_at(:certificateid) rescue nil
            #         #   diamond.end_price = hash.values_at(:usd) rescue nil
                    
            #         diamond.save
            #     # end
                
            #     # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
            #     #          :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
            #     #         :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
    
            end
            
            # chunk.each do |hash|
            #     weight = hash.values_at(:weight)
            #     Diamond.create(:weight => weight)
            # end
    end
    
    
    
end

# print(hash.fetch("Katou"))