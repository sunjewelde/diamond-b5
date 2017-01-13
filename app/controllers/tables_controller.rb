class TablesController < ApplicationController
	include TablesHelper
	
	def new
	end

	require "date"
	def chart_second
		view_context.chart_params
		
	 # 	@latest_date = Table.maximum(:date)
	 #   @oldest_date = Table.minimum(:date)
	    
	 #   # @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]

		# if @latest_date.present?
		#     @one_week_ago = @latest_date - 6
		#     @two_week_ago = @latest_date - 14
		#     @one_months_ago = @latest_date - 30
		#     @three_months_ago = @latest_date - 90
		#     @six_months_ago = @latest_date - 180
		#     @one_year_ago = @latest_date - 364
		# end


	 #   #chart_secondページからグラフ描画の引数を取得
	 #       #For ransack
	 #   @q = Table.ransack(params[:q])
	 #   if params[:q] != nil
		#     weight = params[:q][:weight2]
		#     color_id_ini = params[:q][:color]
		#     array_nil = [""]
		#     color_id = color_id_ini - array_nil
		#     # binding.pry
		#     if color_id.empty?
		#     	color_id = ["1"]
		#     end
		    
		#     clar_id_ini = params[:q][:clar]
		#     clar_id = clar_id_ini - array_nil
		#     if clar_id.empty?
		#     	clar_id = ["1"]
		#     end
		#     date = params[:q][:date]
		    
		#     # binding.pry

		#     color_ref = ColumnListColor.find(color_id)
		#     color = []
		#     color_ref.each do |f|
		#     	c = f.color
		#     	color << c
		#     end

		#     color_ref = ColumnListClar.find(clar_id)
		#     clar = []
		#     color_ref.each do |f|
		#     	c = f.clar
		#     	clar << c
		#     end
		    
		# else
		# 	weight = 0.3
		#     color = ["D"]
		#     clar = ["IF"]
		#     date = "2w"
	 #   end
	
	 #   @selected_weight = weight

		

	 #   # @diamond_all = Table.all

	 #   # @diamonds_default = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> 0.3).where(:clar => "IF").where(:color => "D").group(:date)
	 #   @selected_date = date
	    
	    
	    
	    if @selected_date == "2w"
	    	  @diamonds = @diamonds_2w
	    	  @diamonds_D = @diamonds_D_2W
	    	  @diamonds_E = @diamonds_E_2W
	    	  @diamonds_F = @diamonds_F_2W
	    	  @diamonds_G = @diamonds_G_2W
	    	  @diamonds_H = @diamonds_H_2W
	    	  @diamonds_I = @diamonds_I_2W
	    	  @diamonds_J = @diamonds_J_2W
	    	  @diamonds_K = @diamonds_K_2W
	    	  @diamonds_L = @diamonds_L_2W
	    	  @diamonds_M = @diamonds_M_2W
	    	  #@diamonds = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	    	  #@diamonds_D = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	    	  #@diamonds_E = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	    	  #@diamonds_F = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	    	  #@diamonds_G = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	    	  #@diamonds_H = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	    	  #@diamonds_I = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	    	  #@diamonds_J = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	    	  #@diamonds_K = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	    	  #@diamonds_L = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	    	  #@diamonds_M = Table.where(:date=> @two_week_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	    	  
	      elsif @selected_date == "1m"
	    	  @diamonds = @diamonds_1m
	    	  @diamonds_D = @diamonds_D_1m
	    	  @diamonds_E = @diamonds_E_1m
	    	  @diamonds_F = @diamonds_F_1m
	    	  @diamonds_G = @diamonds_G_1m
	    	  @diamonds_H = @diamonds_H_1m
	    	  @diamonds_I = @diamonds_I_1m
	    	  @diamonds_J = @diamonds_J_1m
	    	  @diamonds_K = @diamonds_K_1m
	    	  @diamonds_L = @diamonds_L_1m
	    	  @diamonds_M = @diamonds_M_1m
	      	  #@diamonds = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  #@diamonds_D = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  #@diamonds_E = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  #@diamonds_F = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  #@diamonds_G = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  #@diamonds_H = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  #@diamonds_I = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  #@diamonds_J = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  #@diamonds_K = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  #@diamonds_L = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  #@diamonds_M = Table.where(:date=> @one_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      	  
	      elsif @selected_date == "3m"
	    	  @diamonds = @diamonds_3m
	    	  @diamonds_D = @diamonds_D_3m
	    	  @diamonds_E = @diamonds_E_3m
	    	  @diamonds_F = @diamonds_F_3m
	    	  @diamonds_G = @diamonds_G_3m
	    	  @diamonds_H = @diamonds_H_3m
	    	  @diamonds_I = @diamonds_I_3m
	    	  @diamonds_J = @diamonds_J_3m
	    	  @diamonds_K = @diamonds_K_3m
	    	  @diamonds_L = @diamonds_L_3m
	    	  @diamonds_M = @diamonds_M_3m
	      	  #@diamonds = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  #@diamonds_D = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  #@diamonds_E = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  #@diamonds_F = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  #@diamonds_G = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  #@diamonds_H = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  #@diamonds_I = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  #@diamonds_J = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  #@diamonds_K = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  #@diamonds_L = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  #@diamonds_M = Table.where(:date=> @three_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      	  
	      elsif @selected_date == "6m"
	          @diamonds = @diamonds_6m
	    	  @diamonds_D = @diamonds_D_6m
	    	  @diamonds_E = @diamonds_E_6m
	    	  @diamonds_F = @diamonds_F_6m
	    	  @diamonds_G = @diamonds_G_6m
	    	  @diamonds_H = @diamonds_H_6m
	    	  @diamonds_I = @diamonds_I_6m
	    	  @diamonds_J = @diamonds_J_6m
	    	  @diamonds_K = @diamonds_K_6m
	    	  @diamonds_L = @diamonds_L_6m
	    	  @diamonds_M = @diamonds_M_6m
	      	  #@diamonds = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  #@diamonds_D = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  #@diamonds_E = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  #@diamonds_F = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  #@diamonds_G = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  #@diamonds_H = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  #@diamonds_I = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  #@diamonds_J = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  #@diamonds_K = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  #@diamonds_L = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  #@diamonds_M = Table.where(:date=> @six_months_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	      elsif @selected_date == "1y"
	          @diamonds = @diamonds_1y
	    	  @diamonds_D = @diamonds_D_1y
	    	  @diamonds_E = @diamonds_E_1y
	    	  @diamonds_F = @diamonds_F_1y
	    	  @diamonds_G = @diamonds_G_1y
	    	  @diamonds_H = @diamonds_H_1y
	    	  @diamonds_I = @diamonds_I_1y
	    	  @diamonds_J = @diamonds_J_1y
	    	  @diamonds_K = @diamonds_K_1y
	    	  @diamonds_L = @diamonds_L_1y
	    	  @diamonds_M = @diamonds_M_1y
	      	  #@diamonds = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => color).group(:date)
	      	  #@diamonds_D = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "D").group(:date)
	      	  #@diamonds_E = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "E").group(:date)
	      	  #@diamonds_F = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "F").group(:date)
	      	  #@diamonds_G = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "G").group(:date)
	      	  #@diamonds_H = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "H").group(:date)
	      	  #@diamonds_I = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "I").group(:date)
	      	  #@diamonds_J = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "J").group(:date)
	      	  #@diamonds_K = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "K").group(:date)
	      	  #@diamonds_L = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "L").group(:date)
	      	  #@diamonds_M = Table.where(:date=> @one_year_ago..@latest_date).where(:weight2=> weight).where(:color => "M").group(:date)
	    end

	    # binding.pry
	    # @diamond_table_data = @diamons
	    
	    	@diamond_table_data_D = @diamonds_D.where(:clar => clar).group(:date)
			date_seriese_D_pre = @diamond_table_data_D.pluck(:date)
			@date_seriese_D = date_seriese_D_pre.map {|d| d.to_datetime.utc.to_i*1000}
			selected_color_end_price_seriese_D = @diamond_table_data_D.pluck(:price)
			@selected_color_end_price_seriese_D = @date_seriese_D.zip(selected_color_end_price_seriese_D)
	    
	    @selected_clar = clar
	    @selected_color = color
		# if @selected_clar != "all" and @selected_color != "all"
		# 	@diamond_table_data = @diamonds.where(:clar => clar).group(:date)
		# 	date_seriese_pre = @diamond_table_data.pluck(:date)
		# 	@date_seriese = date_seriese_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	@selected_color_end_price_seriese = @date_seriese.zip(@diamond_table_data.pluck(:price))
			
		# elsif @selected_clar == "all" and @selected_color == "all"
			@diamond_table_data_D = @diamonds_D.group(:date)
			date_seriese_D_pre = @diamond_table_data_D.pluck(:date)
			@date_seriese_D = date_seriese_D_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "IF").pluck(:price))
				vvs1_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "VVS1").pluck(:price))
				vvs2_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "VVS2").pluck(:price))
				vs1_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "VS1").pluck(:price))
				vs2_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "VS2").pluck(:price))
				si1_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "SI1").pluck(:price))
				si2_D_end_price_seriese = @date_seriese_D.zip(@diamond_table_data_D.where(clar: "SI2").pluck(:price))

			@diamond_table_data_E= @diamonds_E.group(:date)
			date_seriese_E_pre = @diamond_table_data_E.pluck(:date)
			@date_seriese_E = date_seriese_E_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "IF").pluck(:price))
				vvs1_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "VVS1").pluck(:price))
				vvs2_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "VVS2").pluck(:price))
				vs1_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "VS1").pluck(:price))
				vs2_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "VS2").pluck(:price))
				si1_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "SI1").pluck(:price))
				si2_E_end_price_seriese = @date_seriese_E.zip(@diamond_table_data_E.where(clar: "SI2").pluck(:price))
			
			@diamond_table_data_F = @diamonds_F.group(:date)
			date_seriese_F_pre = @diamond_table_data_F.pluck(:date)
			@date_seriese_F = date_seriese_F_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "IF").pluck(:price))
				vvs1_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "VVS1").pluck(:price))
				vvs2_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "VVS2").pluck(:price))
				vs1_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "VS1").pluck(:price))
				vs2_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "VS2").pluck(:price))
				si1_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "SI1").pluck(:price))
				si2_F_end_price_seriese = @date_seriese_F.zip(@diamond_table_data_F.where(clar: "SI2").pluck(:price))
			
			@diamond_table_data_G = @diamonds_G.group(:date)
			date_seriese_G_pre = @diamond_table_data_G.pluck(:date)
			@date_seriese_G = date_seriese_G_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "IF").pluck(:price))
				vvs1_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "VVS1").pluck(:price))
				vvs2_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "VVS2").pluck(:price))
				vs1_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "VS1").pluck(:price))
				vs2_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "VS2").pluck(:price))
				si1_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "SI1").pluck(:price))
				si2_G_end_price_seriese = @date_seriese_G.zip(@diamond_table_data_G.where(clar: "SI2").pluck(:price))
				
			@diamond_table_data_H = @diamonds_H.group(:date)
			date_seriese_H_pre = @diamond_table_data_H.pluck(:date)
			@date_seriese_H = date_seriese_H_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "IF").pluck(:price))
				vvs1_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "VVS1").pluck(:price))
				vvs2_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "VVS2").pluck(:price))
				vs1_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "VS1").pluck(:price))
				vs2_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "VS2").pluck(:price))
				si1_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "SI1").pluck(:price))
				si2_H_end_price_seriese = @date_seriese_H.zip(@diamond_table_data_H.where(clar: "SI2").pluck(:price))
			
			@diamond_table_data_I = @diamonds_I.group(:date)
			date_seriese_I_pre = @diamond_table_data_I.pluck(:date)
			@date_seriese_I = date_seriese_I_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "IF").pluck(:price))
				vvs1_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "VVS1").pluck(:price))
				vvs2_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "VVS2").pluck(:price))
				vs1_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "VS1").pluck(:price))
				vs2_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "VS2").pluck(:price))
				si1_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "SI1").pluck(:price))
				si2_I_end_price_seriese = @date_seriese_I.zip(@diamond_table_data_I.where(clar: "SI2").pluck(:price))
				
			@diamond_table_data_J = @diamonds_J.group(:date)
			date_seriese_J_pre = @diamond_table_data_J.pluck(:date)
			@date_seriese_J = date_seriese_J_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "IF").pluck(:price))
				vvs1_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "VVS1").pluck(:price))
				vvs2_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "VVS2").pluck(:price))
				vs1_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "VS1").pluck(:price))
				vs2_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "VS2").pluck(:price))
				si1_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "SI1").pluck(:price))
				si2_J_end_price_seriese = @date_seriese_J.zip(@diamond_table_data_J.where(clar: "SI2").pluck(:price))
				
			@diamond_table_data_K = @diamonds_K.group(:date)
			date_seriese_K_pre = @diamond_table_data_K.pluck(:date)
			@date_seriese_K = date_seriese_K_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "IF").pluck(:price))
				vvs1_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "VVS1").pluck(:price))
				vvs2_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "VVS2").pluck(:price))
				vs1_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "VS1").pluck(:price))
				vs2_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "VS2").pluck(:price))
				si1_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "SI1").pluck(:price))
				si2_K_end_price_seriese = @date_seriese_K.zip(@diamond_table_data_K.where(clar: "SI2").pluck(:price))
				
			@diamond_table_data_L = @diamonds_L.group(:date)
			date_seriese_L_pre = @diamond_table_data_L.pluck(:date)
			@date_seriese_L = date_seriese_L_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "IF").pluck(:price))
				vvs1_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "VVS1").pluck(:price))
				vvs2_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "VVS2").pluck(:price))
				vs1_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "VS1").pluck(:price))
				vs2_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "VS2").pluck(:price))
				si1_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "SI1").pluck(:price))
				si2_L_end_price_seriese = @date_seriese_L.zip(@diamond_table_data_L.where(clar: "SI2").pluck(:price))
				
			@diamond_table_data_M = @diamonds_M.group(:date)
			date_seriese_M_pre = @diamond_table_data_M.pluck(:date)
			@date_seriese_M = date_seriese_M_pre.map {|d| d.to_datetime.utc.to_i*1000}
				if_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "IF").pluck(:price))
				vvs1_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "VVS1").pluck(:price))
				vvs2_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "VVS2").pluck(:price))
				vs1_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "VS1").pluck(:price))
				vs2_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "VS2").pluck(:price))
				si1_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "SI1").pluck(:price))
				si2_M_end_price_seriese = @date_seriese_M.zip(@diamond_table_data_M.where(clar: "SI2").pluck(:price))

			# @diamond_table_data_E = @diamonds_E.group(:date)
			# @date_seriese_E = @diamond_table_data_E.pluck(:date)
			# 	if_E_end_price = @diamond_table_data_E.where(clar: "IF")
			# 	vvs1_E_end_price = @diamond_table_data_E.where(clar: "VVS1")
			# 	vvs2_E_end_price = @diamond_table_data_E.where(clar: "VVS2")
			# 	vs1_E_end_price = @diamond_table_data_E.where(clar: "VS1")
			# 	vs2_E_end_price = @diamond_table_data_E.where(clar: "VS2")
			# 	si1_E_end_price = @diamond_table_data_E.where(clar: "SI1")
			# 	si2_E_end_price = @diamond_table_data_E.where(clar: "SI2")

			# 	if_E_end_price_seriese = if_E_end_price.pluck(:price)
			# 	vvs1_E_end_price_seriese = vvs1_E_end_price.pluck(:price)
			# 	vvs2_E_end_price_seriese = vvs2_E_end_price.pluck(:price)
			# 	vs1_E_end_price_seriese = vs1_E_end_price.pluck(:price)
			# 	vs2_E_end_price_seriese = vs2_E_end_price.pluck(:price)
			# 	si1_E_end_price_seriese = si1_E_end_price.pluck(:price)
			# 	si2_E_end_price_seriese = si2_E_end_price.pluck(:price)

			
		# elsif @selected_calr != "all" and @selected_color == "all"
		# 	@diamond_table_data_D = @diamonds_D.where(:clar => clar).group(:date)
		# 	date_seriese_D_pre = @diamond_table_data_D.pluck(:date)
		# 	@date_seriese_D = date_seriese_D_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_D = @diamond_table_data_D.pluck(:price)
		# 	@selected_color_end_price_seriese_D = @date_seriese_D.zip(selected_color_end_price_seriese_D)

		# 	@diamond_table_data_E = @diamonds_E.where(:clar => clar).group(:date)
		# 	date_seriese_E_pre = @diamond_table_data_E.pluck(:date)
		# 	@date_seriese_E = date_seriese_E_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_E = @diamond_table_data_E.pluck(:price)
		# 	@selected_color_end_price_seriese_E = @date_seriese_E.zip(selected_color_end_price_seriese_E)

		# 	@diamond_table_data_F = @diamonds_F.where(:clar => clar).group(:date)
		# 	date_seriese_F_pre = @diamond_table_data_F.pluck(:date)
		# 	@date_seriese_F = date_seriese_F_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_F = @diamond_table_data_F.pluck(:price)
		# 	@selected_color_end_price_seriese_F = @date_seriese_F.zip(selected_color_end_price_seriese_F)

		# 	@diamond_table_data_G = @diamonds_G.where(:clar => clar).group(:date)
		# 	date_seriese_G_pre = @diamond_table_data_G.pluck(:date)
		# 	@date_seriese_G = date_seriese_G_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_G = @diamond_table_data_G.pluck(:price)
		# 	@selected_color_end_price_seriese_G = @date_seriese_G.zip(selected_color_end_price_seriese_G)

		# 	@diamond_table_data_H = @diamonds_H.where(:clar => clar).group(:date)
		# 	date_seriese_H_pre = @diamond_table_data_H.pluck(:date)
		# 	@date_seriese_H = date_seriese_H_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_H = @diamond_table_data_H.pluck(:price)
		# 	@selected_color_end_price_seriese_H = @date_seriese_H.zip(selected_color_end_price_seriese_H)

		# 	@diamond_table_data_I = @diamonds_I.where(:clar => clar).group(:date)
		# 	date_seriese_I_pre = @diamond_table_data_I.pluck(:date)
		# 	@date_seriese_I = date_seriese_I_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_I = @diamond_table_data_I.pluck(:price)
		# 	@selected_color_end_price_seriese_I = @date_seriese_I.zip(selected_color_end_price_seriese_I)

		# 	@diamond_table_data_J = @diamonds_J.where(:clar => clar).group(:date)
		# 	date_seriese_J_pre = @diamond_table_data_J.pluck(:date)
		# 	@date_seriese_J = date_seriese_J_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_J = @diamond_table_data_J.pluck(:price)
		# 	@selected_color_end_price_seriese_J = @date_seriese_J.zip(selected_color_end_price_seriese_J)

		# 	@diamond_table_data_K = @diamonds_K.where(:clar => clar).group(:date)
		# 	date_seriese_K_pre = @diamond_table_data_K.pluck(:date)
		# 	@date_seriese_K = date_seriese_K_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_K = @diamond_table_data_K.pluck(:price)
		# 	@selected_color_end_price_seriese_K = @date_seriese_K.zip(selected_color_end_price_seriese_K)

		# 	@diamond_table_data_L = @diamonds_L.where(:clar => clar).group(:date)
		# 	date_seriese_L_pre = @diamond_table_data_L.pluck(:date)
		# 	@date_seriese_L = date_seriese_L_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_L = @diamond_table_data_L.pluck(:price)
		# 	@selected_color_end_price_seriese_L = @date_seriese_L.zip(selected_color_end_price_seriese_L)

		# 	@diamond_table_data_M = @diamonds_M.where(:clar => clar).group(:date)
		# 	date_seriese_M_pre = @diamond_table_data_M.pluck(:date)
		# 	@date_seriese_M = date_seriese_M_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 	selected_color_end_price_seriese_M = @diamond_table_data_M.pluck(:price)
		# 	@selected_color_end_price_seriese_M = @date_seriese_M.zip(selected_color_end_price_seriese_M)


		# elsif @selected_clar == "all" and @selected_color != "all"
		#   @diamond_table_data2 = @diamonds.group(:date)
		#   date_seriese_pre = @diamond_table_data2.pluck(:date)
		#   @date_seriese2 = date_seriese_pre.map {|d| d.to_datetime.utc.to_i*1000}
		# 		if_end_price_seriese = @diamond_table_data2.where(clar: "IF").pluck(:price)
		# 		vvs1_end_price_seriese = @diamond_table_data2.where(clar: "VVS1").pluck(:price)
		# 		vvs2_end_price_seriese = @diamond_table_data2.where(clar: "VVS2").pluck(:price)
		# 		vs1_end_price_seriese = @diamond_table_data2.where(clar: "VS1").pluck(:price)
		# 		vs2_end_price_seriese = @diamond_table_data2.where(clar: "VS2").pluck(:price)
		# 		si1_end_price_seriese = @diamond_table_data2.where(clar: "SI1").pluck(:price)
		# 		si2_end_price_seriese = @diamond_table_data2.where(clar: "SI2").pluck(:price)

		# 		if_end_price_seriese_zip = @date_seriese2.zip(if_end_price_seriese)
		# 		vvs1_end_price_seriese_zip = @date_seriese2.zip(vvs1_end_price_seriese)
		# 		vvs2_end_price_seriese_zip = @date_seriese2.zip(vvs2_end_price_seriese)
		# 		vs1_end_price_seriese_zip = @date_seriese2.zip(vs1_end_price_seriese)
		# 		vs2_end_price_seriese_zip = @date_seriese2.zip(vs2_end_price_seriese)
		# 		si1_end_price_seriese_zip = @date_seriese2.zip(si1_end_price_seriese)
		# 		si2_end_price_seriese_zip = @date_seriese2.zip(si2_end_price_seriese)
					
		# end
# binding.pry

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			f.global(useUTC: false)
			# if clar == "all" and color != "all"
			# 	  #f.title(:text => "Diamond Price #{weight}カラット")
			# 	  #f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {second: '%l:%M:%S %p',
   #   #                         minute: '%l:%M %p', 
   #   #                         hour: '%l:%M %p',
   #   #                         day: '%e. %b', week: '%e. %b', 
   #   #                         month: '%b \'%y', year: '%Y'}, :title => { text: 'Date'})
   #               f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {day: '%e. %b', month: '%b'}, :title => { text: 'Date'})
			# 	  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
			# 	  f.series(:name => "#{color}_IF", :data => if_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_VVS1", :data => vvs1_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_VVS2", :data => vvs2_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_VS1", :data => vs1_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_VS2", :data => vs2_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_SI1", :data => si1_end_price_seriese_zip)
			# 	  f.series(:name => "#{color}_SI2", :data => si2_end_price_seriese_zip)
				  
			# 	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
			# 	  f.chart(type: 'line', height: 600)

			# elsif clar == "all" and color == "all"
				  #f.title(:text => "Diamond Price Chart #{weight}カラット")
				  #f.xAxis(:categories => @date_seriese_D)
				  #f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {second: '%l:%M:%S %p',
      #                         minute: '%l:%M %p', 
      #                         hour: '%l:%M %p',
      #                         day: '%e. %b', week: '%e. %b', 
      #                         month: '%b \'%y', year: '%Y'}, :title => { text: 'Date'})
                  f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {day: '%e. %b', month: '%b'}, :title => { text: 'Date'})
				  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
				  					#D-------------------------------
					if color.include?("D") and clar.include?("IF")
				  	f.series(:name => "D_IF", :data => if_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("VVS1")
				  	f.series(:name => "D_VVS1", :data => vvs1_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("VVS2")
						f.series(:name => "D_VVS2", :data => vvs2_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("VS1")
						f.series(:name => "D_VS1", :data => vs1_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("VS2")
						f.series(:name => "D_VS2", :data => vs2_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("SI1")
						f.series(:name => "D_SI1", :data => si1_D_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("D") and clar.include?("SI1")
						f.series(:name => "D_SI2", :data => si2_D_end_price_seriese, :marker => {enabled: false})
					end

					#E--------------------------------
					if color.include?("E") and clar.include?("IF")
				  	f.series(:name => "E_IF", :data => if_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("VVS1")
				  	f.series(:name => "E_VVS1", :data => vvs1_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("VVS2")
						f.series(:name => "E_VVS2", :data => vvs2_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("VS1")
						f.series(:name => "E_VS1", :data => vs1_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("VS2")
						f.series(:name => "E_VS2", :data => vs2_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("SI1")
						f.series(:name => "E_SI1", :data => si1_E_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("E") and clar.include?("SI1")
						f.series(:name => "E_SI2", :data => si2_E_end_price_seriese, :marker => {enabled: false})
					end

					#F---------------------------------
					if color.include?("F") and clar.include?("IF")
				  	f.series(:name => "F_IF", :data => if_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("VVS1")
				  	f.series(:name => "F_VVS1", :data => vvs1_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("VVS2")
						f.series(:name => "F_VVS2", :data => vvs2_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("VS1")
						f.series(:name => "F_VS1", :data => vs1_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("VS2")
						f.series(:name => "F_VS2", :data => vs2_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("SI1")
						f.series(:name => "F_SI1", :data => si1_F_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("F") and clar.include?("SI1")
						f.series(:name => "F_SI2", :data => si2_F_end_price_seriese, :marker => {enabled: false})
					end

					#G------------------------------------
					if color.include?("G") and clar.include?("IF")
				  	f.series(:name => "G_IF", :data => if_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("VVS1")
				  	f.series(:name => "G_VVS1", :data => vvs1_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("VVS2")
						f.series(:name => "G_VVS2", :data => vvs2_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("VS1")
						f.series(:name => "G_VS1", :data => vs1_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("VS2")
						f.series(:name => "G_VS2", :data => vs2_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("SI1")
						f.series(:name => "G_SI1", :data => si1_G_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("G") and clar.include?("SI1")
						f.series(:name => "G_SI2", :data => si2_G_end_price_seriese, :marker => {enabled: false})
					end

					#H---------------------------------
					if color.include?("H") and clar.include?("IF")
				  	f.series(:name => "H_IF", :data => if_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("VVS1")
				  	f.series(:name => "H_VVS1", :data => vvs1_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("VVS2")
						f.series(:name => "H_VVS2", :data => vvs2_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("VS1")
						f.series(:name => "H_VS1", :data => vs1_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("VS2")
						f.series(:name => "H_VS2", :data => vs2_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("SI1")
						f.series(:name => "H_SI1", :data => si1_H_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("H") and clar.include?("SI1")
						f.series(:name => "H_SI2", :data => si2_H_end_price_seriese, :marker => {enabled: false})
					end

					#I-----------------------------------------
					if color.include?("I") and clar.include?("IF")
				  	f.series(:name => "I_IF", :data => if_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("VVS1")
				  	f.series(:name => "I_VVS1", :data => vvs1_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("VVS2")
						f.series(:name => "I_VVS2", :data => vvs2_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("VS1")
						f.series(:name => "I_VS1", :data => vs1_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("VS2")
						f.series(:name => "I_VS2", :data => vs2_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("SI1")
						f.series(:name => "I_SI1", :data => si1_I_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("I") and clar.include?("SI1")
						f.series(:name => "I_SI2", :data => si2_I_end_price_seriese, :marker => {enabled: false})
					end

					#J----------------------------------------------
					if color.include?("J") and clar.include?("IF")
				  	f.series(:name => "J_IF", :data => if_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("VVS1")
				  	f.series(:name => "J_VVS1", :data => vvs1_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("VVS2")
						f.series(:name => "J_VVS2", :data => vvs2_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("VS1")
						f.series(:name => "J_VS1", :data => vs1_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("VS2")
						f.series(:name => "J_VS2", :data => vs2_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("SI1")
						f.series(:name => "J_SI1", :data => si1_J_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("J") and clar.include?("SI1")
						f.series(:name => "J_SI2", :data => si2_J_end_price_seriese, :marker => {enabled: false})
					end

					#K-------------------------------------------------
					if color.include?("K") and clar.include?("IF")
				  	f.series(:name => "K_IF", :data => if_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("VVS1")
				  	f.series(:name => "K_VVS1", :data => vvs1_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("VVS2")
						f.series(:name => "K_VVS2", :data => vvs2_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("VS1")
						f.series(:name => "K_VS1", :data => vs1_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("VS2")
						f.series(:name => "K_VS2", :data => vs2_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("SI1")
						f.series(:name => "K_SI1", :data => si1_K_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("K") and clar.include?("SI1")
						f.series(:name => "K_SI2", :data => si2_K_end_price_seriese, :marker => {enabled: false})
					end

					#L--------------------------------------------------
					if color.include?("L") and clar.include?("IF")
				  	f.series(:name => "L_IF", :data => if_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("VVS1")
				  	f.series(:name => "L_VVS1", :data => vvs1_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("VVS2")
						f.series(:name => "L_VVS2", :data => vvs2_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("VS1")
						f.series(:name => "L_VS1", :data => vs1_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("VS2")
						f.series(:name => "L_VS2", :data => vs2_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("SI1")
						f.series(:name => "L_SI1", :data => si1_L_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("L") and clar.include?("SI1")
						f.series(:name => "L_SI2", :data => si2_L_end_price_seriese, :marker => {enabled: false})
					end

					#M----------------------------------------------------------
					if color.include?("M") and clar.include?("IF")
				  	f.series(:name => "M_IF", :data => if_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("VVS1")
				  	f.series(:name => "M_VVS1", :data => vvs1_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("VVS2")
						f.series(:name => "M_VVS2", :data => vvs2_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("VS1")
						f.series(:name => "M_VS1", :data => vs1_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("VS2")
						f.series(:name => "M_VS2", :data => vs2_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("SI1")
						f.series(:name => "M_SI1", :data => si1_M_end_price_seriese, :marker => {enabled: false})
					end
					if color.include?("M") and clar.include?("SI1")
						f.series(:name => "M_SI2", :data => si2_M_end_price_seriese, :marker => {enabled: false})
					end

				  #f.series(:name => "D_IF", :data => if_D_end_price_seriese)
				  #f.series(:name => "D_VVS1", :data => vvs1_D_end_price_seriese)
				  #f.series(:name => "D_VVS2", :data => vvs2_D_end_price_seriese)
				  #f.series(:name => "D_VS1", :data => vs1_D_end_price_seriese)
				  #f.series(:name => "D_VS2", :data => vs2_D_end_price_seriese)
				  #f.series(:name => "D_SI1", :data => si1_D_end_price_seriese)
				  #f.series(:name => "D_SI2", :data => si2_D_end_price_seriese)

				  #f.series(:name => "E_IF", :data => if_E_end_price_seriese)
				  #f.series(:name => "E_VVS1", :data => vvs1_E_end_price_seriese)
				  #f.series(:name => "E_VVS2", :data => vvs2_E_end_price_seriese)
				  #f.series(:name => "E_VS1", :data => vs1_E_end_price_seriese)
				  #f.series(:name => "E_VS2", :data => vs2_E_end_price_seriese)
				  #f.series(:name => "E_SI1", :data => si1_E_end_price_seriese)
				  #f.series(:name => "E_SI2", :data => si2_E_end_price_seriese)

				  #f.series(:name => "F_IF", :data => if_F_end_price_seriese)
				  #f.series(:name => "F_VVS1", :data => vvs1_F_end_price_seriese)
				  #f.series(:name => "F_VVS2", :data => vvs2_F_end_price_seriese)
				  #f.series(:name => "F_VS1", :data => vs1_F_end_price_seriese)
				  #f.series(:name => "F_VS2", :data => vs2_F_end_price_seriese)
				  #f.series(:name => "F_SI1", :data => si1_F_end_price_seriese)
				  #f.series(:name => "F_SI2", :data => si2_F_end_price_seriese)

				  #f.series(:name => "G_IF", :data => if_G_end_price_seriese)
				  #f.series(:name => "G_VVS1", :data => vvs1_G_end_price_seriese)
				  #f.series(:name => "G_VVS2", :data => vvs2_G_end_price_seriese)
				  #f.series(:name => "G_VS1", :data => vs1_G_end_price_seriese)
				  #f.series(:name => "G_VS2", :data => vs2_G_end_price_seriese)
				  #f.series(:name => "G_SI1", :data => si1_G_end_price_seriese)
				  #f.series(:name => "G_SI2", :data => si2_G_end_price_seriese)

				  #f.series(:name => "H_IF", :data => if_H_end_price_seriese)
				  #f.series(:name => "H_VVS1", :data => vvs1_H_end_price_seriese)
				  #f.series(:name => "H_VVS2", :data => vvs2_H_end_price_seriese)
				  #f.series(:name => "H_VS1", :data => vs1_H_end_price_seriese)
				  #f.series(:name => "H_VS2", :data => vs2_H_end_price_seriese)
				  #f.series(:name => "H_SI1", :data => si1_H_end_price_seriese)
				  #f.series(:name => "H_SI2", :data => si2_H_end_price_seriese)

				  #f.series(:name => "I_IF", :data => if_I_end_price_seriese)
				  #f.series(:name => "I_VVS1", :data => vvs1_I_end_price_seriese)
				  #f.series(:name => "I_VVS2", :data => vvs2_I_end_price_seriese)
				  #f.series(:name => "I_VS1", :data => vs1_I_end_price_seriese)
				  #f.series(:name => "I_VS2", :data => vs2_I_end_price_seriese)
				  #f.series(:name => "I_SI1", :data => si1_I_end_price_seriese)
				  #f.series(:name => "I_SI2", :data => si2_I_end_price_seriese)

				  #f.series(:name => "J_IF", :data => if_J_end_price_seriese)
				  #f.series(:name => "J_VVS1", :data => vvs1_J_end_price_seriese)
				  #f.series(:name => "J_VVS2", :data => vvs2_J_end_price_seriese)
				  #f.series(:name => "J_VS1", :data => vs1_J_end_price_seriese)
				  #f.series(:name => "J_VS2", :data => vs2_J_end_price_seriese)
				  #f.series(:name => "J_SI1", :data => si1_J_end_price_seriese)
				  #f.series(:name => "J_SI2", :data => si2_J_end_price_seriese)

				  #f.series(:name => "K_IF", :data => if_K_end_price_seriese)
				  #f.series(:name => "K_VVS1", :data => vvs1_K_end_price_seriese)
				  #f.series(:name => "K_VVS2", :data => vvs2_K_end_price_seriese)
				  #f.series(:name => "K_VS1", :data => vs1_K_end_price_seriese)
				  #f.series(:name => "K_VS2", :data => vs2_K_end_price_seriese)
				  #f.series(:name => "K_SI1", :data => si1_K_end_price_seriese)
				  #f.series(:name => "K_SI2", :data => si2_K_end_price_seriese)

				  #f.series(:name => "L_IF", :data => if_L_end_price_seriese)
				  #f.series(:name => "L_VVS1", :data => vvs1_L_end_price_seriese)
				  #f.series(:name => "L_VVS2", :data => vvs2_L_end_price_seriese)
				  #f.series(:name => "L_VS1", :data => vs1_L_end_price_seriese)
				  #f.series(:name => "L_VS2", :data => vs2_L_end_price_seriese)
				  #f.series(:name => "L_SI1", :data => si1_L_end_price_seriese)
				  #f.series(:name => "L_SI2", :data => si2_L_end_price_seriese)

				  #f.series(:name => "M_IF", :data => if_M_end_price_seriese)
				  #f.series(:name => "M_VVS1", :data => vvs1_M_end_price_seriese)
				  #f.series(:name => "M_VVS2", :data => vvs2_M_end_price_seriese)
				  #f.series(:name => "M_VS1", :data => vs1_M_end_price_seriese)
				  #f.series(:name => "M_VS2", :data => vs2_M_end_price_seriese)
				  #f.series(:name => "M_SI1", :data => si1_M_end_price_seriese)
				  #f.series(:name => "M_SI2", :data => si2_M_end_price_seriese)

				  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
				  f.chart(type: 'line', height: 600)

			# elsif clar != "all" and color == "all"
			# 	  #f.title(:text => "Diamond Price Chart #{weight}カラット")
			# 	  #f.xAxis(:categories => @date_seriese)
			# 	  #f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {second: '%l:%M:%S %p',
   #   #                         minute: '%l:%M %p', 
   #   #                         hour: '%l:%M %p',
   #   #                         day: '%e. %b', week: '%e. %b', 
   #   #                         month: '%b \'%y', year: '%Y'}, :title => { text: 'Date'})
   #               f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {day: '%e. %b', month: '%b'}, :title => { text: 'Date'})
			# 	  f.yAxis(:title => { text: 'Diamond Price($)' })

			# 	  f.series(:name => "D_#{clar}", :data => @selected_color_end_price_seriese_D)
			# 	  f.series(:name => "E_#{clar}", :data => @selected_color_end_price_seriese_E)
			# 	  f.series(:name => "F_#{clar}", :data => @selected_color_end_price_seriese_F)
			# 	  f.series(:name => "G_#{clar}", :data => @selected_color_end_price_seriese_G)
			# 	  f.series(:name => "H_#{clar}", :data => @selected_color_end_price_seriese_H)
			# 	  f.series(:name => "I_#{clar}", :data => @selected_color_end_price_seriese_I)
			# 	  f.series(:name => "J_#{clar}", :data => @selected_color_end_price_seriese_J)
			# 	  f.series(:name => "K_#{clar}", :data => @selected_color_end_price_seriese_K)
			# 	  f.series(:name => "L_#{clar}", :data => @selected_color_end_price_seriese_L)
			# 	  f.series(:name => "M_#{clar}", :data => @selected_color_end_price_seriese_M)

			# 	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
			# 	  f.chart(type: 'line', height: 800)

			# elsif clar != "all" and color != "all"
			# 	  #f.title(:text => "Diamond Price Chart #{weight}カラット")
			# 	  #f.xAxis(:categories => @date_seriese)
			# 	  #f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {second: '%l:%M:%S %p',
   #   #                         minute: '%l:%M %p', 
   #   #                         hour: '%l:%M %p',
   #   #                         day: '%e. %b', week: '%e. %b', 
   #   #                         month: '%b \'%y', year: '%Y'}, :title => { text: 'Date'})
   #               f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {day: '%e. %b', month: '%b'}, :title => { text: 'Date'})
			# 	  f.yAxis(:title => { text: 'Diamond Price($)' })
				  
			# 	  f.series(:name => "#{color}_#{clar}", :data => @selected_color_end_price_seriese)
			# 	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
			# 	  f.chart(type: 'line', height: 600)

			# end
	 	end

	end

end