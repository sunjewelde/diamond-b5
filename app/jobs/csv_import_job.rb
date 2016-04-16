class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        # Diamond.import(params[:file])
        # file = file.path if file.is_a?(File)
            # CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            # chunk.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            
    
            chunk.each do |hash|
                hash.each do |row|
                    diamond = Diamond.new
                    
                    # diamond.date = row["date"] #csvの1列目を格納
                    # diamond.weight = row["weight"] rescue nil
                    # diamond.color = row["color"] rescue nil
                    # diamond.clar = row["clarity"] rescue nil
                    # diamond.length = row["measlength"] rescue nil
                    # diamond.width = row["measwidth"] rescue nil
                    # diamond.depth = row["measdepth"] rescue nil
                    # diamond.cut_grade = row["cut_grade"] rescue nil
                    # diamond.rapnet_list_price = row["rapnet_list_price"] rescue nil
                    # diamond.rapnet_discount = row["rapnet_discount"] rescue nil
                    # diamond.price_per_carat = row["price_per_carat"] rescue nil
                    # diamond.polish = row["polish"] rescue nil
                    # diamond.symmetry = row["symmetry"] rescue nil
                    # diamond.fluorescen = row["fluorescence_intensity"] rescue nil
                    # diamond.certificate_id = row["certificateid"] rescue nil
                    # diamond.end_price = row["usd"] rescue nil
                    
                    diamond.date = row.fetch_values("date")  #csvの1列目を格納
                    diamond.weight = row.fetch_values("weight")
                    diamond.color = row.fetch_values("color")
                    diamond.clar = row.fetch_values("clarity")
                    diamond.length = row.fetch_values("measlength")
                    diamond.width = row.fetch_values("measwidth")
                    diamond.depth = row.fetch_values("measdepth")
                    diamond.cut_grade = row.fetch_values("cut_grade")
                    diamond.rapnet_list_price = row.fetch_values("rapnet_list_price")
                    diamond.rapnet_discount = row.fetch_values("rapnet_discount")
                    diamond.price_per_carat = row.fetch_values("price_per_carat")
                    diamond.polish = row.fetch_values("polish")
                    diamond.symmetry = row.fetch_values("symmetry")
                    diamond.fluorescen = row.fetch_values("fluorescence_intensity")
                    diamond.certificate_id = row.fetch_values("certificateid").to_i
                    diamond.end_price = row.fetch_values("usd")
                    
                    diamond.save
                end
                
                # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
                #          :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
                #         :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
    
            end
    end
    
    
    
end

# print(hash.fetch("Katou"))