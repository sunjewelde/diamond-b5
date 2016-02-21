class TablesController < ApplicationController
	def new
	end

	require "date"
	def chart_second
	  	@latest_date = Table.maximum(:date)
	    @oldest_date = Table.minimum(:date)
	    @one_week_ago = @latest_date - 6
	    @one_months_ago = @latest_date - 30
	    @three_months_ago = @latest_date - 90
	    @six_months_ago = @latest_date - 180
	    @one_year_ago = @latest_date - 364

	    #chart_secondページからグラフ描画の引数を取得
	        #For ransack
	    @q = Table.ransack(params[:q])
	    if params[:q] != nil
		    weight = params[:q][:weight]
		    color = params[:q][:color]
		    clar = params[:q][:clar]
		    date = params[:q][:date]
		else
			weight = 0.3
		    color = "D"
		    clar = "IF"
		    date = "1W"
	    end

	    # binding.pry

	    @diamond_all = Table.all

	    @diamonds_default = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> 0.3).where(:clar => "IF").where(:color => "D").group(:date)
	    # binding.pry
	    # @diamonds = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	    @selected_date = date
	    if @selected_date == "1w"
	    	  @diamonds = Table.where(:date=> @one_week_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "1m"
	      	  @diamonds = Table.where(:date=> @one_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "3m"
	      	  @diamonds = Table.where(:date=> @three_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "6m"
	      	  @diamonds = Table.where(:date=> @six_months_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	      elsif @selected_date == "1y"
	      	  @diamonds = Table.where(:date=> @one_year_ago..@latest_date).where(:weight=> weight).where(:color => color).group(:date)
	    end

	    # binding.pry
	    # @diamond_table_data = @diamons
	    @selected_calr = clar
		if @selected_calr != "all"
			@diamond_table_data = @diamonds.where(:clar => clar).group(:date)
			@date_seriese = @diamond_table_data.pluck(:date)
			@selected_color_end_price_seriese = @diamond_table_data.pluck(:price)
		else
		   @diamond_table_data2 = @diamonds
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


		# selected_color_end_price = @diamond_table_data.where(clar: color)


		@chart = LazyHighCharts::HighChart.new('graph') do |f|
			if clar == "all"
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

			elsif  clar != "all"
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