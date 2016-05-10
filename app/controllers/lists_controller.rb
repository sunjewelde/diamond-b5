class ListsController < ApplicationController
  
  def new
  end
  
  require "date"
  def show
    @q = List.ransack(params[:q])

     #最新旧の日付を取得
    @list_latest_date = List.maximum(:date)
    @list_oldest_date = List.minimum(:date)
    # if @latest_date.present?
    #   @one_week_ago = @latest_date - 6
    # end
    
    if params[:q] != nil
      weight = params[:q][:weight2]
      selected_date = params[:q][:date]
      if selected_date.present?
        date = selected_date
      else
        date = @list_latest_date
      end
      # if params[:q][:date] != nil
      #   date = params[:q][:date]
      # else
      #   date = @list_latest_date
      # end
    else
      weight = 0.3
      date = @list_latest_date
    end

    selected_date = date
    @selected_weight = weight

    if List.exists?(:date => selected_date)
      str = selected_date
      @list_selected_date = str.strftime("%Y年 %m月 %d日")
    else
      str = @list_latest_date
      @list_selected_date = str.strftime("%Y年 %m月 %d日")
      flash.now[:error] = "日付が選択されていない、又はその日付のデータがありません。"
    end
    
    @selected_latest_weight_group = List.select_color_clar.where(:weight2 => weight).where(:date => date)
    # @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(:weight => weight).where(:date => date)
    # @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: @selected_weight).where(date: @list_selected_date)
    
  end

  
  def list_table
    @q = List.ransack(params[:q])
  end
   
   
    
end
