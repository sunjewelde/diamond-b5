# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"
CSV.foreach('db/clar_color.csv') do |row|
  # Diamond.create(:date => row[0], :weight => row[1], :color => row[2], :clar => row[3], :cut_grade => row[4], 
  #               :rapnet_list_price => row[5], :rapnet_discount => row[6], :price_per_carat => row[7], 
  #               :polish => row[8], :symmetry => row[9], :fluorescen => row[10], :certificate_id => row[11], :end_price => row[12])
                
  # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
  #                         :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
  #                       :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
  
  # Table.create(:date => row[1], :weight2 => row[6], :color => row[2], :clar => row[3], :price => row[7])
  
  # Index.create(:date => row[1], :index1 => row[2], :index2 => row[3], :index3 => row[4], :index4 => row[5], :index5 => row[6], 
  #               :price1 => row[7], :price2 => row[8], :price3 => row[9], :price4 => row[10], :price5 => row[11])
  
  ColumnListClar.create(:clar => row[0])
  # Column_list_color.create(:color => row[1])
  
  
end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')