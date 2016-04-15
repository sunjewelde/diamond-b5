class CsvImportJob < ActiveJob::Base
    queue_as :default
    
    def perform(*args)
        # Diamond.import(params[:file])
            CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
                Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
                         :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
                        :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
    
            end
    end
    
    
        # def Diamond.import(file)
        #     # CSV.foreach(file.path, headers: true) do |row|
        #     CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        #     Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
        #              :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
        #             :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])

        #     end
        # end
    
end