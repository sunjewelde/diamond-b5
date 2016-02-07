class ListsController < ApplicationController
  
  def new
   
   @q = List.ransack(params[:q])
    
   @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
   @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
   @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2", "I1", "FL"]
   @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
   @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
   @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
   @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                 "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

   #最新旧の日付を取得
   @latest_date = Diamond.maximum(:date)
   @oldest_date = Diamond.minimum(:date)

    #最新のDiamond_data
    @latest_diamond_group = Diamond.where(date: @latest_date)
    #weightでグループ
    @weight03_diamond_group = @latest_diamond_group.weight03
    @weight03_diamond_group_all = Diamond.weight03
    # @weight04_diamond_group = @latest_diamond_group.weight04

    #colorでグループ
    # for color_group in color
    #   name = color_group
    #   @"#{name}" = @weight03_diamond_group.color("#{color}")
    # end
    # temp = group_color("03", "D")
    # temp_latest_weight_group_03_color_D = temp.to_i
    latest_weight_group_03_color_D = @weight03_diamond_group.weight03.color("D")
    latest_weight_group_03_color_E = @weight03_diamond_group.weight03.color("E")
    latest_weight_group_03_color_F = @weight03_diamond_group.weight03.color("F")
    latest_weight_group_03_color_G = @weight03_diamond_group.weight03.color("G")
    latest_weight_group_03_color_H = @weight03_diamond_group.weight03.color("H")
    latest_weight_group_03_color_I = @weight03_diamond_group.weight03.color("I")
    latest_weight_group_03_color_J = @weight03_diamond_group.weight03.color("J")
    latest_weight_group_03_color_K = @weight03_diamond_group.weight03.color("K")
    latest_weight_group_03_color_L = @weight03_diamond_group.weight03.color("L")
    latest_weight_group_03_color_M = @weight03_diamond_group.weight03.color("M")

    @latest_weight_group_03_color_D_clar = latest_weight_group_03_color_D.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_E_clar = latest_weight_group_03_color_E.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_F_clar = latest_weight_group_03_color_F.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_G_clar = latest_weight_group_03_color_G.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_H_clar = latest_weight_group_03_color_H.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_I_clar = latest_weight_group_03_color_I.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_J_clar = latest_weight_group_03_color_J.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_K_clar = latest_weight_group_03_color_K.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_L_clar = latest_weight_group_03_color_L.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_M_clar = latest_weight_group_03_color_M.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)

    @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
    @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
    # @weight03_group_all_color_date = @weight03_diamond_group_all.select('date').group(:date)
    # @weight03_group_color_color = @weight03_diamond_group_all.select('color').group(:color)
    # @weight03_group_03_color_color = @weight03_group_03_color_temp.compact!
    
    # binding.pry
    #配列からWhileでloop
    # i = 0
    # while i < ary.length
    #   print ary[i]
    #   i += 1
    # end

    d = 0
    while d < @weight03_group_all_color_date.length
      date = @weight03_group_all_color_date[d]
      if List.exists?(date: date) and List.exists?(weight: 0.3) and List.exists?(color: "D") and List.exists?(color: "M")
      else
          i = 0
          while i < @color.length
              selected_color = @color[i]
              @selected_color_data = @weight03_group_all_color.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').where(date: d.date).where(color: selected_color)
              @selected_color_IF = @selected_color_data.find_by clar: "IF"
              @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
              @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
              @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
              @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
              @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
              @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
              
              @IF_price = @selected_color_IF.avg_price.round
              @VVS1_price = @selected_color_VVS1.avg_price.round
              @VVS2_price = @selected_color_VVS2.avg_price.round
              @VS1_price = @selected_color_VS1.avg_price.round
              @VS2_price = @selected_color_VS2.avg_price.round
              @SI1_price = @selected_color_SI1.avg_price.round
              @SI2_price = @selected_color_SI2.avg_price.round
              
              # binding.pry
              
              List.create(date: d.date, color: selected_color, weight: 0.3,  if1: @IF_price, 
                                                                      vvs1: @VVS1_price,
                                                                      vvs2: @VVS2_price, 
                                                                      vs1: @VS1_price,
                                                                      vs2: @VS2_price,
                                                                      si1: @SI1_price,
                                                                      si2: @SI2_price)
              i += 1
          end  
      end
      d += 1
    end
   @latest_weight_group_03 = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: 0.3).where(date: @latest_date)
  end
  
  def list_table
    @q = List.ransack(params[:q])
  end
   
   
    
end
