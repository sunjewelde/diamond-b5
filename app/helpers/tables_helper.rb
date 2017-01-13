module TablesHelper
    
    def chart_params
        @latest_date = Table.maximum(:date)
	    @oldest_date = Table.minimum(:date)

		if @latest_date.present?
		    @one_week_ago = @latest_date - 6
		    @two_week_ago = @latest_date - 14
		    @one_months_ago = @latest_date - 30
		    @three_months_ago = @latest_date - 90
		    @six_months_ago = @latest_date - 180
		    @one_year_ago = @latest_date - 364
		end

	    #chart_secondページからグラフ描画の引数を取得
	        #For ransack
	    @q = Table.ransack(params[:q])
	    if params[:q] != nil
		    weight = params[:q][:weight2]
		    color_id_ini = params[:q][:color]
		    array_nil = [""]
		    color_id = color_id_ini - array_nil
		    # binding.pry
		    if color_id.empty?
		    	color_id = ["1"]
		    end
		    
		    clar_id_ini = params[:q][:clar]
		    clar_id = clar_id_ini - array_nil
		    if clar_id.empty?
		    	clar_id = ["1"]
		    end
		    date = params[:q][:date]
		    
		    # binding.pry

		    color_ref = ColumnListColor.find(color_id)
		    color = []
		    color_ref.each do |f|
		    	c = f.color
		    	color << c
		    end

		    color_ref = ColumnListClar.find(clar_id)
		    clar = []
		    color_ref.each do |f|
		    	c = f.clar
		    	clar << c
		    end
		    
		else
			weight = 0.3
		    color = ["D"]
		    clar = ["IF"]
		    date = "2w"
	    end
	
	    @selected_weight = weight
	    @selected_date = date
	    
	   # if @selected_date == "2w"
	    	  @diamonds_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	    	  @diamonds_D_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	    	  @diamonds_E_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	    	  @diamonds_F_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	    	  @diamonds_G_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	    	  @diamonds_H_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	    	  @diamonds_I_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	    	  @diamonds_J_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	    	  @diamonds_K_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	    	  @diamonds_L_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	    	  @diamonds_M_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	    	  
	   #   elsif @selected_date == "1m"
	      	  @diamonds_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      	  
	   #   elsif @selected_date == "3m"
	      	  @diamonds_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      	  
	   #   elsif @selected_date == "6m"
	      	  @diamonds_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      	  
	   #   elsif @selected_date == "1y"
	      	  @diamonds_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M_1y = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	   # end
	    
    end
    
    
    
end
