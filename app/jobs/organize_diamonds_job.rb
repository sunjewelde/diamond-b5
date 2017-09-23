require "date"
class OrganizeDiamondsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)

      @latest_date_ref = Diamond.maximum(:date)
      @latest_date_table = Table.maximum(:date)
      @last_updated_date_table = @latest_date_table + 1
      
      # diamond_date = Diamond.where(:date => @last_updated_date_table..@latest_date_ref).map(&:date).uniq
      diamond_date = Diamond.where(:date => @latest_date_ref).map(&:date).uniq
      # diamond_date = Diamond.find_each(start: 12000000, batch_size: 10000).map(&:date).uniq
      # table_date = Table.pluck(:date).uniq
      uniq_date = diamond_date.compact.sort {|a, b| b <=> a }

	    
      @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
      @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
      @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
      @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
      @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
      @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
      @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                 "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]
	    
	    
	   # if @latest_date == @latest_date_table and @oldest_date == @oldest_date_table
	   # elsif @latest_date == @oldest_date
	   #   if Table.exists?(date: @latest_date, weight2: 0.3, color: "D", clar: "IF")
	   #   else
	   #       @weight03_diamond_group_all = Diamond.weight03.where(:date=> @latest_date).shape("RB")
    #         @weight04_diamond_group_all = Diamond.weight04.where(:date=> @latest_date).shape("RB")
    #         @weight05_diamond_group_all = Diamond.weight05.where(:date=> @latest_date).shape("RB")
    #         @weight06_diamond_group_all = Diamond.weight06.where(:date=> @latest_date).shape("RB")
    #         @weight07_diamond_group_all = Diamond.weight07.where(:date=> @latest_date).shape("RB")
    #         @weight08_diamond_group_all = Diamond.weight08.where(:date=> @latest_date).shape("RB")
    #         @weight09_diamond_group_all = Diamond.weight09.where(:date=> @latest_date).shape("RB")
    #         @weight10_diamond_group_all = Diamond.weight10.where(:date=> @latest_date).shape("RB")
    #         @weight12_diamond_group_all = Diamond.weight12.where(:date=> @latest_date).shape("RB")
    #         @weight15_diamond_group_all = Diamond.weight15.where(:date=> @latest_date).shape("RB")
    #         @weight18_diamond_group_all = Diamond.weight18.where(:date=> @latest_date).shape("RB")
    #         @weight20_diamond_group_all = Diamond.weight20.where(:date=> @latest_date).shape("RB")
    #         @weight30_diamond_group_all = Diamond.weight30.where(:date=> @latest_date).shape("RB")
    #         @weight40_diamond_group_all = Diamond.weight40.where(:date=> @latest_date).shape("RB")
            
    #       @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       #-----Create data table create for Table model-------------
    #           #weight0.3
    #           d = 0
    #           while d < @weight03_group_all_color_date.length
    #             date = @weight03_group_all_color_date[d]
    #             # date = @latest_date
    #             if Table.exists?(date: date, weight2: 0.3, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.3, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight03_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.3, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.3,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
              
    #           #weight0.4
    #           d = 0
    #           while d < @weight04_group_all_color_date.length
    #             date = @weight04_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.4, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.4, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight04_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.4, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.4,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.5
    #           d = 0
    #           while d < @weight05_group_all_color_date.length
    #             date = @weight05_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.5, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight05_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.5, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.5,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.6
    #           d = 0
    #           while d < @weight06_group_all_color_date.length
    #             date = @weight06_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.6, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.6, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight06_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.6, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.6,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.7
    #           d = 0
    #           while d < @weight07_group_all_color_date.length
    #             date = @weight07_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.7, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.7, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight07_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.7, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.7,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.8
    #           d = 0
    #           while d < @weight08_group_all_color_date.length
    #             date = @weight08_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.8, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight08_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.8, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.8,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
    #           #weight0.9
    #           d = 0
    #           while d < @weight09_group_all_color_date.length
    #             date = @weight09_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.9, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.9, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight09_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.9, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.9,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight10
    #           d = 0
    #           while d < @weight10_group_all_color_date.length
    #             date = @weight10_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight10_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight12
    #           d = 0
    #           while d < @weight12_group_all_color_date.length
    #             date = @weight12_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.2, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.2, color: "M", clar: "SI2")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight12_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.2, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.2,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight15
    #           d = 0
    #           while d < @weight15_group_all_color_date.length
    #             date = @weight15_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.5, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight15_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.5, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.5,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight18
    #           d = 0
    #           while d < @weight18_group_all_color_date.length
    #             date = @weight18_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.8, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight18_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.8, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.8,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight20
    #           d = 0
    #           while d < @weight20_group_all_color_date.length
    #             date = @weight20_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 2.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 2.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight20_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 2.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 2.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight30
    #           d = 0
    #           while d < @weight30_group_all_color_date.length
    #             date = @weight30_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 3.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 3.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight30_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 3.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 3.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight40
    #           d = 0
    #           while d < @weight40_group_all_color_date.length
    #             date = @weight40_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 4.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 4.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight40_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 4.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 4.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
    #         #-----End_Create data table create for Table model-------------
	   #   end
 
	   # elsif @latest_date != @oldest_date
    	    #date, clar, colorでグループ
          # if Table.exists?(date: @latest_date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: @oldest_date, weight: 4.0, color: "M" )
          # if @latest_date_table.present? and Table.exists?(date: @latest_date, weight2: 0.3, color: "D", clar: "IF")
        
      d = 0
      while d < uniq_date.length
      date = uniq_date[d]      
          if uniq_date != []
          
          @weight03_diamond_group_all = Diamond.weight03.where(:date=> date).where(shape: "BR")
          @weight04_diamond_group_all = Diamond.weight04.where(:date=> date).where(shape: "BR")
          @weight05_diamond_group_all = Diamond.weight05.where(:date=> date).where(shape: "BR")
          @weight06_diamond_group_all = Diamond.weight06.where(:date=> date).where(shape: "BR")
          @weight07_diamond_group_all = Diamond.weight07.where(:date=> date).where(shape: "BR")
          @weight08_diamond_group_all = Diamond.weight08.where(:date=> date).where(shape: "BR")
          @weight09_diamond_group_all = Diamond.weight09.where(:date=> date).where(shape: "BR")
          @weight10_diamond_group_all = Diamond.weight10.where(:date=> date).where(shape: "BR")
          @weight12_diamond_group_all = Diamond.weight12.where(:date=> date).where(shape: "BR")
          @weight15_diamond_group_all = Diamond.weight15.where(:date=> date).where(shape: "BR")
          @weight18_diamond_group_all = Diamond.weight18.where(:date=> date).where(shape: "BR")
          @weight20_diamond_group_all = Diamond.weight20.where(:date=> date).where(shape: "BR")
          @weight30_diamond_group_all = Diamond.weight30.where(:date=> date).where(shape: "BR")
          @weight40_diamond_group_all = Diamond.weight40.where(:date=> date).where(shape: "BR")
          

          
          @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar)
          # @weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          #-----Create data table create for Table model-------------
              #weight0.3
              # d = 0
              # while d < @weight03_group_all_color_date.length
              #   date = @weight03_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.3, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.3, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          # @selected_color_data = @weight03_group_all_color.where(date: date).where(color: selected_color)
                          @selected_color_data = @weight03_group_all_color.where(color: selected_color)
                          # @selected_color_data = @weight03_group_all_color.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.3, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.3,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight0.4
              # d = 0
              # while d < @weight04_group_all_color_date.length
              #   date = @weight04_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.4, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.4, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight04_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.4, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.4,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight0.5
              # d = 0
              # while d < @weight05_group_all_color_date.length
              #   date = @weight05_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.5, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight05_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.5, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.5,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight0.6
              # d = 0
              # while d < @weight06_group_all_color_date.length
              #   date = @weight06_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.6, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.6, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight06_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.6, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.6,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight0.7
              # d = 0
              # while d < @weight07_group_all_color_date.length
              #   date = @weight07_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.7, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.7, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight07_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.7, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.7,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight0.8
              # d = 0
              # while d < @weight08_group_all_color_date.length
              #   date = @weight08_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.8, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight08_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.8, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.8,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
              
              #weight0.9
              # d = 0
              # while d < @weight09_group_all_color_date.length
              #   date = @weight09_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 0.9, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.9, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight09_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 0.9, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 0.9,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight10
              # d = 0
              # while d < @weight10_group_all_color_date.length
              #   date = @weight10_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 1.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.0, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight10_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 1.0, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 1.0,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight12
              # d = 0
              # while d < @weight12_group_all_color_date.length
              #   date = @weight12_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 1.2, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.2, color: "M", clar: "SI2")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight12_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 1.2, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 1.2,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight15
              # d = 0
              # while d < @weight15_group_all_color_date.length
              #   date = @weight15_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 1.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.5, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight15_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 1.5, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 1.5,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight18
              # d = 0
              # while d < @weight18_group_all_color_date.length
              #   date = @weight18_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 1.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.8, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight18_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 1.8, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 1.8,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight20
              # d = 0
              # while d < @weight20_group_all_color_date.length
              #   date = @weight20_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 2.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 2.0, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight20_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 2.0, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 2.0,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight30
              # d = 0
              # while d < @weight30_group_all_color_date.length
              #   date = @weight30_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 3.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 3.0, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight30_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 3.0, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 3.0,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
          
              #weight40
              # d = 0
              # while d < @weight40_group_all_color_date.length
              #   date = @weight40_group_all_color_date[d]
                if Table.exists?(date: date, weight2: 4.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 4.0, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight40_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Table.exists?(date: date, weight2: 4.0, color: selected_color, clar: selcted_clar)
                                else
                                	Table.create(date: date, color: selected_color, weight2: 4.0,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
            #-----End_Create data table create for Table model-------------
          end
        d += 1
      end
          
	   # elsif @latest_date != @oldest_date and @oldest_date < @oldest_date_table
    # 	    #date, clar, colorでグループ
    #       # if Table.exists?(date: @latest_date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: @oldest_date, weight: 4.0, color: "M" )
    #       # if Table.exists?(date: @latest_date, weight2: 0.3, color: "D", clar: "IF")
    #       # else
    #       @weight03_diamond_group_all = Diamond.weight03.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight04_diamond_group_all = Diamond.weight04.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight05_diamond_group_all = Diamond.weight05.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight06_diamond_group_all = Diamond.weight06.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight07_diamond_group_all = Diamond.weight07.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight08_diamond_group_all = Diamond.weight08.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight09_diamond_group_all = Diamond.weight09.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight10_diamond_group_all = Diamond.weight10.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight12_diamond_group_all = Diamond.weight12.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight15_diamond_group_all = Diamond.weight15.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight18_diamond_group_all = Diamond.weight18.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight20_diamond_group_all = Diamond.weight20.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight30_diamond_group_all = Diamond.weight30.where(:date=> @last_updated_date_table..@latest_date)
    #       @weight40_diamond_group_all = Diamond.weight40.where(:date=> @last_updated_date_table..@latest_date)
          
    #       @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       #-----Create data table create for Table model-------------
    #           #weight0.3
    #           d = 0
    #           while d < @weight03_group_all_color_date.length
    #             date = @weight03_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.3, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.3, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight03_group_all_color.where(date: date).where(color: selected_color)
    #                       # @selected_color_data = @weight03_group_all_color.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.3, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.3,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.4
    #           d = 0
    #           while d < @weight04_group_all_color_date.length
    #             date = @weight04_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.4, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.4, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight04_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.4, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.4,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.5
    #           d = 0
    #           while d < @weight05_group_all_color_date.length
    #             date = @weight05_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.5, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight05_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.5, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.5,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.6
    #           d = 0
    #           while d < @weight06_group_all_color_date.length
    #             date = @weight06_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.6, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.6, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight06_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.6, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.6,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.7
    #           d = 0
    #           while d < @weight07_group_all_color_date.length
    #             date = @weight07_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.7, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.7, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight07_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.7, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.7,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight0.8
    #           d = 0
    #           while d < @weight08_group_all_color_date.length
    #             date = @weight08_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.8, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight08_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.8, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.8,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
    #           #weight0.9
    #           d = 0
    #           while d < @weight09_group_all_color_date.length
    #             date = @weight09_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 0.9, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 0.9, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight09_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 0.9, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 0.9,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight10
    #           d = 0
    #           while d < @weight10_group_all_color_date.length
    #             date = @weight10_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight10_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight12
    #           d = 0
    #           while d < @weight12_group_all_color_date.length
    #             date = @weight12_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.2, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.2, color: "M", clar: "SI2")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight12_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.2, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.2,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight15
    #           d = 0
    #           while d < @weight15_group_all_color_date.length
    #             date = @weight15_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.5, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.5, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight15_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.5, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.5,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight18
    #           d = 0
    #           while d < @weight18_group_all_color_date.length
    #             date = @weight18_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 1.8, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 1.8, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight18_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 1.8, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 1.8,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight20
    #           d = 0
    #           while d < @weight20_group_all_color_date.length
    #             date = @weight20_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 2.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 2.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight20_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 2.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 2.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight30
    #           d = 0
    #           while d < @weight30_group_all_color_date.length
    #             date = @weight30_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 3.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 3.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight30_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 3.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 3.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
          
    #           #weight40
    #           d = 0
    #           while d < @weight40_group_all_color_date.length
    #             date = @weight40_group_all_color_date[d]
    #             if Table.exists?(date: date, weight2: 4.0, color: "D", clar: "IF") and Table.exists?(date: date, weight2: 4.0, color: "M")
    #             else
    #                 i = 0
    #                 while i < @color.length
    #                     selected_color = @color[i]
    #                     j = 0
    #                     while j < @clar.length
    #                       selcted_clar = @clar[j]
    #                       @selected_color_data = @weight40_group_all_color.where(date: date).where(color: selected_color)
    #                       @selected_clar = @selected_color_data.find_by clar: selcted_clar
                          
    #                         if @selected_clar.present? and @selected_clar.avg_price != ""
    #                             @selected_price = @selected_clar.avg_price.round
    #                             if Table.exists?(date: date, weight2: 4.0, color: selected_color, clar: selcted_clar)
    #                             else
    #                             	Table.create(date: date, color: selected_color, weight2: 4.0,  clar: selcted_clar, price: @selected_price)
    #                             end
    #                         end
    #                       j += 1
    #                     end
    #                     i += 1
    #                 end
    #             end
    #             d += 1
    #           end
            #-----End_Create data table create for Table model-------------
          # end

	   # end
    # MyMailer.upload_confirmation.deliver
  end
end
