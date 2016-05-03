class TablesController < ApplicationController
	def new
	end

	require "date"
	def chart_second
	  	@latest_date = Table.maximum(:date)
	    @oldest_date = Table.minimum(:date)

		if @latest_date.present?
		    @one_week_ago = @latest_date - 6
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
		    color = params[:q][:color]
		    clar = params[:q][:clar]
		    date = params[:q][:date]
		else
			weight = 0.3
		    color = "D"
		    clar = "IF"
		    date = "1w"
	    end

	    @selected_weight = weight


	    # @diamond_all = Table.all

	    @diamonds_default = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> 0.3).where(:clar => "IF").where(:color => "D").group(:date)
	    @selected_date = date
	    
	    if @selected_date == "1w"
	    	  @diamonds = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	    	  @diamonds_D = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	    	  @diamonds_E = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	    	  @diamonds_F = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	    	  @diamonds_G = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	    	  @diamonds_H = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	    	  @diamonds_I = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	    	  @diamonds_J = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	    	  @diamonds_K = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	    	  @diamonds_L = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	    	  @diamonds_M = Table.where(:date=> @one_week_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      elsif @selected_date == "1m"
	      	  @diamonds = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      elsif @selected_date == "3m"
	      	  @diamonds = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      elsif @selected_date == "6m"
	      	  @diamonds = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      elsif @selected_date == "1y"
	      	  @diamonds = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  @diamonds_D = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  @diamonds_E = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  @diamonds_F = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  @diamonds_G = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  @diamonds_H = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  @diamonds_I = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  @diamonds_J = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  @diamonds_K = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  @diamonds_L = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  @diamonds_M = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	    end

	    # binding.pry
	    # @diamond_table_data = @diamons
	    
	    @selected_clar = clar
	    @selected_color = color
		if @selected_clar != "all" and @selected_color != "all"
			@diamond_table_data = @diamonds.where(:clar => clar).group(:date)
			@date_seriese = @diamond_table_data.pluck(:date)
			@selected_color_end_price_seriese = @diamond_table_data.pluck(:price)
		elsif @selected_clar == "all" and @selected_color == "all"
			# @diamond_table_data = @diamonds_D
			@diamond_table_data_D = @diamonds_D.group(:date)
			@date_seriese_D = @diamond_table_data_D.pluck(:date)
				if_D_end_price = @diamond_table_data_D.where(clar: "IF")
				vvs1_D_end_price = @diamond_table_data_D.where(clar: "VVS1")
				vvs2_D_end_price = @diamond_table_data_D.where(clar: "VVS2")
				vs1_D_end_price = @diamond_table_data_D.where(clar: "VS1")
				vs2_D_end_price = @diamond_table_data_D.where(clar: "VS2")
				si1_D_end_price = @diamond_table_data_D.where(clar: "SI1")
				si2_D_end_price = @diamond_table_data_D.where(clar: "SI2")

				if_D_end_price_seriese = if_D_end_price.pluck(:price)
				vvs1_D_end_price_seriese = vvs1_D_end_price.pluck(:price)
				vvs2_D_end_price_seriese = vvs2_D_end_price.pluck(:price)
				vs1_D_end_price_seriese = vs1_D_end_price.pluck(:price)
				vs2_D_end_price_seriese = vs2_D_end_price.pluck(:price)
				si1_D_end_price_seriese = si1_D_end_price.pluck(:price)
				si2_D_end_price_seriese = si2_D_end_price.pluck(:price)

			@diamond_table_data_E = @diamonds_E.group(:date)
			@date_seriese_E = @diamond_table_data_E.pluck(:date)
				if_E_end_price = @diamond_table_data_E.where(clar: "IF")
				vvs1_E_end_price = @diamond_table_data_E.where(clar: "VVS1")
				vvs2_E_end_price = @diamond_table_data_E.where(clar: "VVS2")
				vs1_E_end_price = @diamond_table_data_E.where(clar: "VS1")
				vs2_E_end_price = @diamond_table_data_E.where(clar: "VS2")
				si1_E_end_price = @diamond_table_data_E.where(clar: "SI1")
				si2_E_end_price = @diamond_table_data_E.where(clar: "SI2")

				if_E_end_price_seriese = if_E_end_price.pluck(:price)
				vvs1_E_end_price_seriese = vvs1_E_end_price.pluck(:price)
				vvs2_E_end_price_seriese = vvs2_E_end_price.pluck(:price)
				vs1_E_end_price_seriese = vs1_E_end_price.pluck(:price)
				vs2_E_end_price_seriese = vs2_E_end_price.pluck(:price)
				si1_E_end_price_seriese = si1_E_end_price.pluck(:price)
				si2_E_end_price_seriese = si2_E_end_price.pluck(:price)

			@diamond_table_data_F = @diamonds_F.group(:date)
			@date_seriese_F = @diamond_table_data_F.pluck(:date)
				if_F_end_price = @diamond_table_data_F.where(clar: "IF")
				vvs1_F_end_price = @diamond_table_data_F.where(clar: "VVS1")
				vvs2_F_end_price = @diamond_table_data_F.where(clar: "VVS2")
				vs1_F_end_price = @diamond_table_data_F.where(clar: "VS1")
				vs2_F_end_price = @diamond_table_data_F.where(clar: "VS2")
				si1_F_end_price = @diamond_table_data_F.where(clar: "SI1")
				si2_F_end_price = @diamond_table_data_F.where(clar: "SI2")

				if_F_end_price_seriese = if_F_end_price.pluck(:price)
				vvs1_F_end_price_seriese = vvs1_F_end_price.pluck(:price)
				vvs2_F_end_price_seriese = vvs2_F_end_price.pluck(:price)
				vs1_F_end_price_seriese = vs1_F_end_price.pluck(:price)
				vs2_F_end_price_seriese = vs2_F_end_price.pluck(:price)
				si1_F_end_price_seriese = si1_F_end_price.pluck(:price)
				si2_F_end_price_seriese = si2_F_end_price.pluck(:price)

			@diamond_table_data_G = @diamonds_G.group(:date)
			@date_seriese_G = @diamond_table_data_G.pluck(:date)
				if_G_end_price = @diamond_table_data_G.where(clar: "IF")
				vvs1_G_end_price = @diamond_table_data_G.where(clar: "VVS1")
				vvs2_G_end_price = @diamond_table_data_G.where(clar: "VVS2")
				vs1_G_end_price = @diamond_table_data_G.where(clar: "VS1")
				vs2_G_end_price = @diamond_table_data_G.where(clar: "VS2")
				si1_G_end_price = @diamond_table_data_G.where(clar: "SI1")
				si2_G_end_price = @diamond_table_data_G.where(clar: "SI2")

				if_G_end_price_seriese = if_G_end_price.pluck(:price)
				vvs1_G_end_price_seriese = vvs1_G_end_price.pluck(:price)
				vvs2_G_end_price_seriese = vvs2_G_end_price.pluck(:price)
				vs1_G_end_price_seriese = vs1_G_end_price.pluck(:price)
				vs2_G_end_price_seriese = vs2_G_end_price.pluck(:price)
				si1_G_end_price_seriese = si1_G_end_price.pluck(:price)
				si2_G_end_price_seriese = si2_G_end_price.pluck(:price)

			@diamond_table_data_H = @diamonds_H.group(:date)
			@date_seriese_H = @diamond_table_data_H.pluck(:date)
				if_H_end_price = @diamond_table_data_H.where(clar: "IF")
				vvs1_H_end_price = @diamond_table_data_H.where(clar: "VVS1")
				vvs2_H_end_price = @diamond_table_data_H.where(clar: "VVS2")
				vs1_H_end_price = @diamond_table_data_H.where(clar: "VS1")
				vs2_H_end_price = @diamond_table_data_H.where(clar: "VS2")
				si1_H_end_price = @diamond_table_data_H.where(clar: "SI1")
				si2_H_end_price = @diamond_table_data_H.where(clar: "SI2")

				if_H_end_price_seriese = if_H_end_price.pluck(:price)
				vvs1_H_end_price_seriese = vvs1_H_end_price.pluck(:price)
				vvs2_H_end_price_seriese = vvs2_H_end_price.pluck(:price)
				vs1_H_end_price_seriese = vs1_H_end_price.pluck(:price)
				vs2_H_end_price_seriese = vs2_H_end_price.pluck(:price)
				si1_H_end_price_seriese = si1_H_end_price.pluck(:price)
				si2_H_end_price_seriese = si2_H_end_price.pluck(:price)

			@diamond_table_data_I = @diamonds_I.group(:date)
			@date_seriese_I = @diamond_table_data_I.pluck(:date)
				if_I_end_price = @diamond_table_data_I.where(clar: "IF")
				vvs1_I_end_price = @diamond_table_data_I.where(clar: "VVS1")
				vvs2_I_end_price = @diamond_table_data_I.where(clar: "VVS2")
				vs1_I_end_price = @diamond_table_data_I.where(clar: "VS1")
				vs2_I_end_price = @diamond_table_data_I.where(clar: "VS2")
				si1_I_end_price = @diamond_table_data_I.where(clar: "SI1")
				si2_I_end_price = @diamond_table_data_I.where(clar: "SI2")

				if_I_end_price_seriese = if_I_end_price.pluck(:price)
				vvs1_I_end_price_seriese = vvs1_I_end_price.pluck(:price)
				vvs2_I_end_price_seriese = vvs2_I_end_price.pluck(:price)
				vs1_I_end_price_seriese = vs1_I_end_price.pluck(:price)
				vs2_I_end_price_seriese = vs2_I_end_price.pluck(:price)
				si1_I_end_price_seriese = si1_I_end_price.pluck(:price)
				si2_I_end_price_seriese = si2_I_end_price.pluck(:price)

			@diamond_table_data_J = @diamonds_J.group(:date)
			@date_seriese_J = @diamond_table_data_J.pluck(:date)
				if_J_end_price = @diamond_table_data_J.where(clar: "IF")
				vvs1_J_end_price = @diamond_table_data_J.where(clar: "VVS1")
				vvs2_J_end_price = @diamond_table_data_J.where(clar: "VVS2")
				vs1_J_end_price = @diamond_table_data_J.where(clar: "VS1")
				vs2_J_end_price = @diamond_table_data_J.where(clar: "VS2")
				si1_J_end_price = @diamond_table_data_J.where(clar: "SI1")
				si2_J_end_price = @diamond_table_data_J.where(clar: "SI2")

				if_J_end_price_seriese = if_J_end_price.pluck(:price)
				vvs1_J_end_price_seriese = vvs1_J_end_price.pluck(:price)
				vvs2_J_end_price_seriese = vvs2_J_end_price.pluck(:price)
				vs1_J_end_price_seriese = vs1_J_end_price.pluck(:price)
				vs2_J_end_price_seriese = vs2_J_end_price.pluck(:price)
				si1_J_end_price_seriese = si1_J_end_price.pluck(:price)
				si2_J_end_price_seriese = si2_J_end_price.pluck(:price)

			@diamond_table_data_K = @diamonds_K.group(:date)
			@date_seriese_K = @diamond_table_data_K.pluck(:date)
				if_K_end_price = @diamond_table_data_K.where(clar: "IF")
				vvs1_K_end_price = @diamond_table_data_K.where(clar: "VVS1")
				vvs2_K_end_price = @diamond_table_data_K.where(clar: "VVS2")
				vs1_K_end_price = @diamond_table_data_K.where(clar: "VS1")
				vs2_K_end_price = @diamond_table_data_K.where(clar: "VS2")
				si1_K_end_price = @diamond_table_data_K.where(clar: "SI1")
				si2_K_end_price = @diamond_table_data_K.where(clar: "SI2")

				if_K_end_price_seriese = if_K_end_price.pluck(:price)
				vvs1_K_end_price_seriese = vvs1_K_end_price.pluck(:price)
				vvs2_K_end_price_seriese = vvs2_K_end_price.pluck(:price)
				vs1_K_end_price_seriese = vs1_K_end_price.pluck(:price)
				vs2_K_end_price_seriese = vs2_K_end_price.pluck(:price)
				si1_K_end_price_seriese = si1_K_end_price.pluck(:price)
				si2_K_end_price_seriese = si2_K_end_price.pluck(:price)

			@diamond_table_data_L = @diamonds_L.group(:date)
			@date_seriese_L = @diamond_table_data_L.pluck(:date)
				if_L_end_price = @diamond_table_data_L.where(clar: "IF")
				vvs1_L_end_price = @diamond_table_data_L.where(clar: "VVS1")
				vvs2_L_end_price = @diamond_table_data_L.where(clar: "VVS2")
				vs1_L_end_price = @diamond_table_data_L.where(clar: "VS1")
				vs2_L_end_price = @diamond_table_data_L.where(clar: "VS2")
				si1_L_end_price = @diamond_table_data_L.where(clar: "SI1")
				si2_L_end_price = @diamond_table_data_L.where(clar: "SI2")

				if_L_end_price_seriese = if_L_end_price.pluck(:price)
				vvs1_L_end_price_seriese = vvs1_L_end_price.pluck(:price)
				vvs2_L_end_price_seriese = vvs2_L_end_price.pluck(:price)
				vs1_L_end_price_seriese = vs1_L_end_price.pluck(:price)
				vs2_L_end_price_seriese = vs2_L_end_price.pluck(:price)
				si1_L_end_price_seriese = si1_L_end_price.pluck(:price)
				si2_L_end_price_seriese = si2_L_end_price.pluck(:price)

			@diamond_table_data_M = @diamonds_M.group(:date)
			@date_seriese_M = @diamond_table_data_M.pluck(:date)
				if_M_end_price = @diamond_table_data_M.where(clar: "IF")
				vvs1_M_end_price = @diamond_table_data_M.where(clar: "VVS1")
				vvs2_M_end_price = @diamond_table_data_M.where(clar: "VVS2")
				vs1_M_end_price = @diamond_table_data_M.where(clar: "VS1")
				vs2_M_end_price = @diamond_table_data_M.where(clar: "VS2")
				si1_M_end_price = @diamond_table_data_M.where(clar: "SI1")
				si2_M_end_price = @diamond_table_data_M.where(clar: "SI2")

				if_M_end_price_seriese = if_M_end_price.pluck(:price)
				vvs1_M_end_price_seriese = vvs1_M_end_price.pluck(:price)
				vvs2_M_end_price_seriese = vvs2_M_end_price.pluck(:price)
				vs1_M_end_price_seriese = vs1_M_end_price.pluck(:price)
				vs2_M_end_price_seriese = vs2_M_end_price.pluck(:price)
				si1_M_end_price_seriese = si1_M_end_price.pluck(:price)
				si2_M_end_price_seriese = si2_M_end_price.pluck(:price)

		elsif @selected_calr != "all" and @selected_color == "all"
			@diamond_table_data_D = @diamonds_D.where(:clar => clar).group(:date)
			@date_seriese_D = @diamond_table_data_D.pluck(:date)
			@selected_color_end_price_seriese_D = @diamond_table_data_D.pluck(:price)

			@diamond_table_data_E = @diamonds_E.where(:clar => clar).group(:date)
			@date_seriese_E = @diamond_table_data_E.pluck(:date)
			@selected_color_end_price_seriese_E = @diamond_table_data_E.pluck(:price)

			@diamond_table_data_F = @diamonds_F.where(:clar => clar).group(:date)
			@date_seriese_F = @diamond_table_data_F.pluck(:date)
			@selected_color_end_price_seriese_F = @diamond_table_data_F.pluck(:price)

			@diamond_table_data_G = @diamonds_G.where(:clar => clar).group(:date)
			@date_seriese_G = @diamond_table_data_G.pluck(:date)
			@selected_color_end_price_seriese_G = @diamond_table_data_G.pluck(:price)

			@diamond_table_data_H = @diamonds_H.where(:clar => clar).group(:date)
			@date_seriese_H = @diamond_table_data_H.pluck(:date)
			@selected_color_end_price_seriese_H = @diamond_table_data_H.pluck(:price)

			@diamond_table_data_I = @diamonds_I.where(:clar => clar).group(:date)
			@date_seriese_I = @diamond_table_data_I.pluck(:date)
			@selected_color_end_price_seriese_I = @diamond_table_data_I.pluck(:price)

			@diamond_table_data_J = @diamonds_J.where(:clar => clar).group(:date)
			@date_seriese_J = @diamond_table_data_J.pluck(:date)
			@selected_color_end_price_seriese_J = @diamond_table_data_J.pluck(:price)

			@diamond_table_data_K = @diamonds_K.where(:clar => clar).group(:date)
			@date_seriese_K = @diamond_table_data_K.pluck(:date)
			@selected_color_end_price_seriese_K = @diamond_table_data_K.pluck(:price)

			@diamond_table_data_L = @diamonds_L.where(:clar => clar).group(:date)
			@date_seriese_L = @diamond_table_data_L.pluck(:date)
			@selected_color_end_price_seriese_L = @diamond_table_data_L.pluck(:price)

			@diamond_table_data_M = @diamonds_M.where(:clar => clar).group(:date)
			@date_seriese_M = @diamond_table_data_M.pluck(:date)
			@selected_color_end_price_seriese_M = @diamond_table_data_M.pluck(:price)

		elsif @selected_clar == "all" and @selected_color != "all"
		   @diamond_table_data2 = @diamonds.group(:date)
		   @date_seriese2 = @diamond_table_data2.pluck(:date)
			    if_end_price = @diamond_table_data2.where(clar: "IF")
				vvs1_end_price = @diamond_table_data2.where(clar: "VVS1")
				vvs2_end_price = @diamond_table_data2.where(clar: "VVS2")
				vs1_end_price = @diamond_table_data2.where(clar: "VS1")
				vs2_end_price = @diamond_table_data2.where(clar: "VS2")
				si1_end_price = @diamond_table_data2.where(clar: "SI1")
				si2_end_price = @diamond_table_data2.where(clar: "SI2")

				if_end_price_seriese = if_end_price.pluck(:price)
				vvs1_end_price_seriese = vvs1_end_price.pluck(:price)
				vvs2_end_price_seriese = vvs2_end_price.pluck(:price)
				vs1_end_price_seriese = vs1_end_price.pluck(:price)
				vs2_end_price_seriese = vs2_end_price.pluck(:price)
				si1_end_price_seriese = si1_end_price.pluck(:price)
				si2_end_price_seriese = si2_end_price.pluck(:price)
		end
# binding.pry

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			if clar == "all" and color != "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese2)
				  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
				  f.series(:name => "#{color}_IF", :data => if_end_price_seriese)
				  f.series(:name => "#{color}_VVS1", :data => vvs1_end_price_seriese)
				  f.series(:name => "#{color}_VVS2", :data => vvs2_end_price_seriese)
				  f.series(:name => "#{color}_VS1", :data => vs1_end_price_seriese)
				  f.series(:name => "#{color}_VS2", :data => vs2_end_price_seriese)
				  f.series(:name => "#{color}_SI1", :data => si1_end_price_seriese)
				  f.series(:name => "#{color}_SI2", :data => si2_end_price_seriese)
				  
				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			elsif clar == "all" and color == "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese_D)
				  f.yAxis(:title => { text: 'Diamond Price($)' })

				  f.series(:name => "D_IF", :data => if_D_end_price_seriese)
				  f.series(:name => "D_VVS1", :data => vvs1_D_end_price_seriese)
				  f.series(:name => "D_VVS2", :data => vvs2_D_end_price_seriese)
				  f.series(:name => "D_VS1", :data => vs1_D_end_price_seriese)
				  f.series(:name => "D_VS2", :data => vs2_D_end_price_seriese)
				  f.series(:name => "D_SI1", :data => si1_D_end_price_seriese)
				  f.series(:name => "D_SI2", :data => si2_D_end_price_seriese)

				  f.series(:name => "E_IF", :data => if_E_end_price_seriese)
				  f.series(:name => "E_VVS1", :data => vvs1_E_end_price_seriese)
				  f.series(:name => "E_VVS2", :data => vvs2_E_end_price_seriese)
				  f.series(:name => "E_VS1", :data => vs1_E_end_price_seriese)
				  f.series(:name => "E_VS2", :data => vs2_E_end_price_seriese)
				  f.series(:name => "E_SI1", :data => si1_E_end_price_seriese)
				  f.series(:name => "E_SI2", :data => si2_E_end_price_seriese)

				  f.series(:name => "F_IF", :data => if_F_end_price_seriese)
				  f.series(:name => "F_VVS1", :data => vvs1_F_end_price_seriese)
				  f.series(:name => "F_VVS2", :data => vvs2_F_end_price_seriese)
				  f.series(:name => "F_VS1", :data => vs1_F_end_price_seriese)
				  f.series(:name => "F_VS2", :data => vs2_F_end_price_seriese)
				  f.series(:name => "F_SI1", :data => si1_F_end_price_seriese)
				  f.series(:name => "F_SI2", :data => si2_F_end_price_seriese)

				  f.series(:name => "G_IF", :data => if_G_end_price_seriese)
				  f.series(:name => "G_VVS1", :data => vvs1_G_end_price_seriese)
				  f.series(:name => "G_VVS2", :data => vvs2_G_end_price_seriese)
				  f.series(:name => "G_VS1", :data => vs1_G_end_price_seriese)
				  f.series(:name => "G_VS2", :data => vs2_G_end_price_seriese)
				  f.series(:name => "G_SI1", :data => si1_G_end_price_seriese)
				  f.series(:name => "G_SI2", :data => si2_G_end_price_seriese)

				  f.series(:name => "H_IF", :data => if_H_end_price_seriese)
				  f.series(:name => "H_VVS1", :data => vvs1_H_end_price_seriese)
				  f.series(:name => "H_VVS2", :data => vvs2_H_end_price_seriese)
				  f.series(:name => "H_VS1", :data => vs1_H_end_price_seriese)
				  f.series(:name => "H_VS2", :data => vs2_H_end_price_seriese)
				  f.series(:name => "H_SI1", :data => si1_H_end_price_seriese)
				  f.series(:name => "H_SI2", :data => si2_H_end_price_seriese)

				  f.series(:name => "I_IF", :data => if_I_end_price_seriese)
				  f.series(:name => "I_VVS1", :data => vvs1_I_end_price_seriese)
				  f.series(:name => "I_VVS2", :data => vvs2_I_end_price_seriese)
				  f.series(:name => "I_VS1", :data => vs1_I_end_price_seriese)
				  f.series(:name => "I_VS2", :data => vs2_I_end_price_seriese)
				  f.series(:name => "I_SI1", :data => si1_I_end_price_seriese)
				  f.series(:name => "I_SI2", :data => si2_I_end_price_seriese)

				  f.series(:name => "J_IF", :data => if_J_end_price_seriese)
				  f.series(:name => "J_VVS1", :data => vvs1_J_end_price_seriese)
				  f.series(:name => "J_VVS2", :data => vvs2_J_end_price_seriese)
				  f.series(:name => "J_VS1", :data => vs1_J_end_price_seriese)
				  f.series(:name => "J_VS2", :data => vs2_J_end_price_seriese)
				  f.series(:name => "J_SI1", :data => si1_J_end_price_seriese)
				  f.series(:name => "J_SI2", :data => si2_J_end_price_seriese)

				  f.series(:name => "K_IF", :data => if_K_end_price_seriese)
				  f.series(:name => "K_VVS1", :data => vvs1_K_end_price_seriese)
				  f.series(:name => "K_VVS2", :data => vvs2_K_end_price_seriese)
				  f.series(:name => "K_VS1", :data => vs1_K_end_price_seriese)
				  f.series(:name => "K_VS2", :data => vs2_K_end_price_seriese)
				  f.series(:name => "K_SI1", :data => si1_K_end_price_seriese)
				  f.series(:name => "K_SI2", :data => si2_K_end_price_seriese)

				  f.series(:name => "L_IF", :data => if_L_end_price_seriese)
				  f.series(:name => "L_VVS1", :data => vvs1_L_end_price_seriese)
				  f.series(:name => "L_VVS2", :data => vvs2_L_end_price_seriese)
				  f.series(:name => "L_VS1", :data => vs1_L_end_price_seriese)
				  f.series(:name => "L_VS2", :data => vs2_L_end_price_seriese)
				  f.series(:name => "L_SI1", :data => si1_L_end_price_seriese)
				  f.series(:name => "L_SI2", :data => si2_L_end_price_seriese)

				  f.series(:name => "M_IF", :data => if_M_end_price_seriese)
				  f.series(:name => "M_VVS1", :data => vvs1_M_end_price_seriese)
				  f.series(:name => "M_VVS2", :data => vvs2_M_end_price_seriese)
				  f.series(:name => "M_VS1", :data => vs1_M_end_price_seriese)
				  f.series(:name => "M_VS2", :data => vs2_M_end_price_seriese)
				  f.series(:name => "M_SI1", :data => si1_M_end_price_seriese)
				  f.series(:name => "M_SI2", :data => si2_M_end_price_seriese)

				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			elsif clar != "all" and color == "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese)
				  f.yAxis(:title => { text: 'Diamond Price($)' })

				  f.series(:name => "D_#{clar}", :data => @selected_color_end_price_seriese_D)
				  f.series(:name => "E_#{clar}", :data => @selected_color_end_price_seriese_E)
				  f.series(:name => "F_#{clar}", :data => @selected_color_end_price_seriese_F)
				  f.series(:name => "G_#{clar}", :data => @selected_color_end_price_seriese_G)
				  f.series(:name => "H_#{clar}", :data => @selected_color_end_price_seriese_H)
				  f.series(:name => "I_#{clar}", :data => @selected_color_end_price_seriese_I)
				  f.series(:name => "J_#{clar}", :data => @selected_color_end_price_seriese_J)
				  f.series(:name => "K_#{clar}", :data => @selected_color_end_price_seriese_K)
				  f.series(:name => "L_#{clar}", :data => @selected_color_end_price_seriese_L)
				  f.series(:name => "M_#{clar}", :data => @selected_color_end_price_seriese_M)

				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 800)

			elsif clar != "all" and color != "all"
				  f.title(:text => "Diamond Price Chart #{weight}カラット")
				  f.xAxis(:categories => @date_seriese)
				  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
				  f.series(:name => "#{color}_#{clar}", :data => @selected_color_end_price_seriese)
				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			end
	 	end

	end

end