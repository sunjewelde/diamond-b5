require "date"
class OrganizeDiamondsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
      # diamond_date = Diamond.pluck(:date).uniq
      
      @latest_date_ref = Diamond.maximum(:date)
      @latest_date_table = Chart.maximum(:date)
      @last_updated_date_table = @latest_date_table + 1
      
      diamond_date = Diamond.where(:date => @last_updated_date_table..@latest_date_ref).map(&:date).uniq

      uniq_date = diamond_date.compact.sort {|a, b| b <=> a }


      @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
      @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
      @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
      @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
      @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
      @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
      @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                 "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]
	    
	   #Cut_grade Excellent, Very Good, Goodの3つを採用。
	   
        # Fluorescence
        # 以下の5段階。Medium以下はBlueのつく場合も採用。それ以外は不採用。
        # None
        # Faint
        # Medium, Medium Blue
        # Strong, Strong Blue
        # Very Strong, Very Strong Blue

      d = 0
      while d < uniq_date.length
      date = uniq_date[d]      
          if uniq_date != []
          
        #   @weight03_diamond_group_all = Diamond.weight03.where(:date=> date).where(shape: "BR")
        #   @weight04_diamond_group_all = Diamond.weight04.where(:date=> date).where(shape: "BR")
        #   @weight05_diamond_group_all = Diamond.weight05.where(:date=> date).where(shape: "BR")
        #   @weight06_diamond_group_all = Diamond.weight06.where(:date=> date).where(shape: "BR")
        #   @weight07_diamond_group_all = Diamond.weight07.where(:date=> date).where(shape: "BR")
        #   @weight08_diamond_group_all = Diamond.weight08.where(:date=> date).where(shape: "BR")
        #   @weight09_diamond_group_all = Diamond.weight09.where(:date=> date).where(shape: "BR")
        #   @weight10_diamond_group_all = Diamond.weight10.where(:date=> date).where(shape: "BR")
        #   @weight12_diamond_group_all = Diamond.weight12.where(:date=> date).where(shape: "BR")
        #   @weight15_diamond_group_all = Diamond.weight15.where(:date=> date).where(shape: "BR")
        #   @weight18_diamond_group_all = Diamond.weight18.where(:date=> date).where(shape: "BR")
        #   @weight20_diamond_group_all = Diamond.weight20.where(:date=> date).where(shape: "BR")
        #   @weight30_diamond_group_all = Diamond.weight30.where(:date=> date).where(shape: "BR")
        #   @weight40_diamond_group_all = Diamond.weight40.where(:date=> date).where(shape: "BR")
        
        #   @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        #   @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
        
        
          #03
          @weight03_diamond_group_cut_A1 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_none
          @weight03_diamond_group_cut_A2 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_faint
          @weight03_diamond_group_cut_A3 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_med
          @weight03_diamond_group_cut_A4 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_strong
          @weight03_diamond_group_cut_A5 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_vs
          
          @weight03_diamond_group_cut_B1 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_none
          @weight03_diamond_group_cut_B2 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_faint
          @weight03_diamond_group_cut_B3 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_med
          @weight03_diamond_group_cut_B4 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_strong
          @weight03_diamond_group_cut_B5 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_vs
          
          @weight03_diamond_group_cut_C1 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_none
          @weight03_diamond_group_cut_C2 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_faint
          @weight03_diamond_group_cut_C3 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_med
          @weight03_diamond_group_cut_C4 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_strong
          @weight03_diamond_group_cut_C5 = Diamond.weight03.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_vs
          
          #04
          @weight04_diamond_group_cut_A1 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_none
          @weight04_diamond_group_cut_A2 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_faint
          @weight04_diamond_group_cut_A3 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_med
          @weight04_diamond_group_cut_A4 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_strong
          @weight04_diamond_group_cut_A5 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_exc.fluorescen_vs
          
          @weight04_diamond_group_cut_B1 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_none
          @weight04_diamond_group_cut_B2 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_faint
          @weight04_diamond_group_cut_B3 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_med
          @weight04_diamond_group_cut_B4 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_strong
          @weight04_diamond_group_cut_B5 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_vg.fluorescen_vs
          
          @weight04_diamond_group_cut_C1 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_none
          @weight04_diamond_group_cut_C2 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_faint
          @weight04_diamond_group_cut_C3 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_med
          @weight04_diamond_group_cut_C4 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_strong
          @weight04_diamond_group_cut_C5 = Diamond.weight04.where(:date=> date).where(shape: "BR").cut_grade_g.fluorescen_vs
          

          
          @weight03_group_all_color_A1 = @weight03_diamond_group_cut_A1.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_A2 = @weight03_diamond_group_cut_A2.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_A3 = @weight03_diamond_group_cut_A3.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_A4 = @weight03_diamond_group_cut_A4.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_A5 = @weight03_diamond_group_cut_A5.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          
          @weight03_group_all_color_B1 = @weight03_diamond_group_cut_B1.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_B2 = @weight03_diamond_group_cut_B2.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_B3 = @weight03_diamond_group_cut_B3.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_B4 = @weight03_diamond_group_cut_B4.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_B5 = @weight03_diamond_group_cut_B5.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          
          @weight03_group_all_color_C1 = @weight03_diamond_group_cut_C1.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_C2 = @weight03_diamond_group_cut_C2.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_C3 = @weight03_diamond_group_cut_C3.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_C4 = @weight03_diamond_group_cut_C4.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight03_group_all_color_C5 = @weight03_diamond_group_cut_C5.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          
          
          
          @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, cut_grade, fluorescen, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar, :cut_grade, :fluorescen)
          
          #-----Create data table create for Chart model-------------
              #weight0.3
              # d = 0
              # while d < @weight03_group_all_color_date.length
              #   date = @weight03_group_all_color_date[d]
                if Chart.exists?(date: date, weight2: 0.3, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.3, color: "M")
                else
                    i = 0
                    while i < @color.length
                        selected_color = @color[i]
                        j = 0
                        while j < @clar.length
                          selcted_clar = @clar[j]
                          @selected_color_data = @weight03_group_all_color.where(color: selected_color)
                          @selected_clar = @selected_color_data.find_by clar: selcted_clar
                            if @selected_clar.present? and @selected_clar.avg_price != ""
                                @selected_price = @selected_clar.avg_price.round
                                if Chart.exists?(date: date, weight2: 0.3, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.3,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.4, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.4, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.4, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.4,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.5, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.5, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.5, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.5,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.6, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.6, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.6, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.6,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.7, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.7, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.7, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.7,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.8, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.8, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.8, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.8,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 0.9, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 0.9, color: "M")
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
                                if Chart.exists?(date: date, weight2: 0.9, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 0.9,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 1.0, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 1.0, color: "M")
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
                                if Chart.exists?(date: date, weight2: 1.0, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 1.0,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 1.2, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 1.2, color: "M", clar: "SI2")
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
                                if Chart.exists?(date: date, weight2: 1.2, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 1.2,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 1.5, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 1.5, color: "M")
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
                                if Chart.exists?(date: date, weight2: 1.5, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 1.5,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 1.8, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 1.8, color: "M")
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
                                if Chart.exists?(date: date, weight2: 1.8, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 1.8,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 2.0, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 2.0, color: "M")
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
                                if Chart.exists?(date: date, weight2: 2.0, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 2.0,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 3.0, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 3.0, color: "M")
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
                                if Chart.exists?(date: date, weight2: 3.0, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 3.0,  clar: selcted_clar, price: @selected_price)
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
                if Chart.exists?(date: date, weight2: 4.0, color: "D", clar: "IF") and Chart.exists?(date: date, weight2: 4.0, color: "M")
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
                                if Chart.exists?(date: date, weight2: 4.0, color: selected_color, clar: selcted_clar)
                                else
                                	Chart.create(date: date, color: selected_color, weight2: 4.0,  clar: selcted_clar, price: @selected_price)
                                end
                            end
                          j += 1
                        end
                        i += 1
                    end
                end
              #   d += 1
              # end
            #-----End_Create data table create for Chart model-------------
          end
        d += 1
      end
          
	   
    MyMailer.upload_confirmation.deliver
  end
end
