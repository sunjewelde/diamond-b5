class ListsController < ApplicationController
  
  def new
  end

  def show
    @q = List.ransack(params[:q])

     @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
     @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
     @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
     @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
     @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
     @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
     @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                   "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

     #最新旧の日付を取得
    @list_latest_date = List.maximum(:date)
    @list_oldest_date = List.minimum(:date)
    if @latest_date.present?
      @one_week_ago = @latest_date - 6
    end

   
    if params[:q] != nil
      weight = params[:q][:weight]
      if params[:q][:date] != nil
        date = params[:q][:date]
      else
        date = @list_latest_date
      end
    else
      weight = 0.3
      date = @list_latest_date
    end

    selected_date = date
    @selected_weight = weight

    if List.exists?(date: selected_date)
      @selected_date = selected_date
    else
      @selected_date = @latest_date
      flash.now[:error] = "日付が選択されていない、又はその日付のデータがありません。"
    end

     @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: weight).where(date: @selected_date)
  end

  
  def list_table
    @q = List.ransack(params[:q])
  end
   
   
    
end
