# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8
require "csv"
CSV.foreach('db/diamond2.csv') do |row|
  Diamond.create(:date => row[0], :weight => row[1], :color => row[2], :clar => row[3], :cut_grade => row[4], 
                :rapnet_list_price => row[5], :rapnet_discount => row[6], :price_per_carat => row[7], 
                :polish => row[8], :symmetry => row[9], :fluorescen => row[10], :certificate_id => row[11], :end_price => row[12])
end