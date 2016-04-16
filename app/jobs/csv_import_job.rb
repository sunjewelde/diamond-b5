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
                    
                    diamond.date = row["date"][0] rescue nil #csvの1列目を格納
                    diamond.weight = row["weight"][0] rescue nil
                    diamond.color = row["color"][0] rescue nil
                    diamond.clar = row["clarity"][0] rescue nil
                    diamond.length = row["measlength"][0] rescue nil
                    diamond.width = row["measwidth"][0] rescue nil
                    diamond.depth = row["measdepth"][0] rescue nil
                    diamond.cut_grade = row["cut_grade"][0] rescue nil
                    diamond.rapnet_list_price = row["rapnet_list_price"][0] rescue nil
                    diamond.rapnet_discount = row["rapnet_discount"][0] rescue nil
                    diamond.price_per_carat = row["price_per_carat"][0] rescue nil
                    diamond.polish = row["polish"][0] rescue nil
                    diamond.symmetry = row["symmetry"][0] rescue nil
                    diamond.fluorescen = row["fluorescence_intensity"][0] rescue nil
                    diamond.certificate_id = row["certificateid"][0] rescue nil
                    diamond.end_price = row["usd"][0] rescue nil
                    
                    # diamond.date = row.fetch("date")  #csvの1列目を格納
                    # diamond.weight = row.fetch("weight")
                    # diamond.color = row.fetch("color")
                    # diamond.clar = row.fetch("clarity")
                    # diamond.length = row.fetch("measlength")
                    # diamond.width = row.fetch("measwidth")
                    # diamond.depth = row.fetch("measdepth")
                    # diamond.cut_grade = row.fetch("cut_grade")
                    # diamond.rapnet_list_price = row.fetch("rapnet_list_price")
                    # diamond.rapnet_discount = row.fetch("rapnet_discount")
                    # diamond.price_per_carat = row.fetch("price_per_carat")
                    # diamond.polish = row.fetch("polish")
                    # diamond.symmetry = row.fetch("symmetry")
                    # diamond.fluorescen = row.fetch("fluorescence_intensity")
                    # diamond.certificate_id = row.fetch("certificateid").to_i
                    # diamond.end_price = row.fetch("usd")
                    
                    diamond.save
                end
                
                # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
                #          :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
                #         :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
    
            end
    end
    
    
    
end

# print(hash.fetch("Katou"))