class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(chunk)
        # Diamond.import(params[:file])
        # file = file.path if file.is_a?(File)
            # CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            # chunk.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
            chunk.feach do |hash|
                diamond = Diamond.new
                diamond.date = hash.fetch("date")  #csvの1列目を格納
                diamond.weight = hash.fetch("weight")
                diamond.color = hash.fetch("color")
                diamond.clar = hash.fetch("clarity")
                diamond.length = hash.fetch("measlength")
                diamond.width = hash.fetch("measwidth")
                diamond.depth = hash.fetch("measdepth")
                diamond.cut_grade = hash.fetch("cut_grade")
                diamond.rapnet_list_price = hash.fetch("rapnet_list_price")
                diamond.rapnet_discount = hash.fetch("rapnet_discount")
                diamond.price_per_carat = hash.fetch("price_per_carat")
                diamond.polish = hash.fetch("polish")
                diamond.symmetry = hash.fetch("symmetry")
                diamond.fluorescen = hash.fetch("fluorescence_intensity")
                diamond.certificate_id = hash.fetch("certificateid")
                diamond.end_price = hash.fetch("usd")
                
                diamond.save
                
                
                # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
                #          :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
                #         :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
    
            end
    end
    
    
    
end

# print(hash.fetch("Katou"))