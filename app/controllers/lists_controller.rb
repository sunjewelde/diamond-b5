class ListsController < ApplicationController
  
  def new
  end

  def show
    @q = List.ransack(params[:q])

     #最新旧の日付を取得
    @list_latest_date = List.maximum(:date)
    @list_oldest_date = List.minimum(:date)
    # if @latest_date.present?
    #   @one_week_ago = @latest_date - 6
    # end
    
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
      @list_selected_date = selected_date
    else
      @list_selected_date = @list_latest_date
      flash.now[:error] = "日付が選択されていない、又はその日付のデータがありません。"
    end
    
    # @group_list = List.where(date: list_selected_date)
    # @selected_latest_weight_group = @group_list.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: @selected_weigh)
    
    # @selected_latest_weight_group = List.where(weight: @selected_weigh).where(date: @list_selected_date)

    @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: weight).where(date: date)
    # @selected_latest_weight_group = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight: @selected_weight).where(date: @list_selected_date)
  end

  
  def list_table
    @q = List.ransack(params[:q])
  end
   
   
    
end
