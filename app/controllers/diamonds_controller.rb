class DiamondsController < ApplicationController
  before_action :require_user, except: [:index, :chart]
  
  
  def new
    @diamond = Diamond.new
  end

  def group_color(weight, color)
    "@weight" + weight + "_diamond_group.weight" + weight + ".color(" + "\"" + color + "\"" + ")"
  end
  
  def run
    OrganizeDiamondsJob.perform_later
    #EventWorker.perform_async
    redirect_to root_url, notice: "チャート用データ作成を開始しました。"
  end
  
  def make_list
    OrganizeListsJob.perform_later
    #EventWorker.perform_async
    redirect_to root_url, notice: "Daily価格テーブル作成を開始しました。"
  end
  
  def make_index
    OrganizeIndexJob.perform_later
    redirect_to root_url, notice: "Indexテーブル作成を開始しました。"
  end

  def import
    @file = params[:file].path
    options = {:col_sep => ',', :row_sep => :auto, :remove_empty_values => false,
    :remove_empty_hashes => false, :file_encoding  => 'iso-8859-1'}
    SmarterCSV.process(@file, options) do |chunk|
      CsvImportJob.perform_later(chunk)
    end
    redirect_to root_url, notice: "Diamondデータの追加を開始しました。"
  end
  
  require "date"
  def index
   
   
    # @diamonds = Diamond.all
    #kaminariでページネーション
    # @diamonds = Diamond.page(params[:page])
    @q = Diamond.ransack(params[:q])
    # @diamonds2 = @q.result(distinct: true)
   
   @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
   @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
   @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
   @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
   @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
   @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
   @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                 "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

   #最新旧の日付を取得
  @latest_date = Table.maximum(:date)
  @oldest_date = Table.minimum(:date)
  if @latest_date.present?
    @one_week_ago = @latest_date - 6
  end
  
  if @latest_date <= Date.new(2015, 12, 31)
    @ref_date = Date.new(2015, 1, 1)
  elsif @latest_date >= Date.new(2016, 1, 1) and @latest_date <= Date.new(2016, 12, 31)
    @ref_date = Date.new(2016, 1, 1)
  elsif @latest_date >= Date.new(2017, 1, 1) and @latest_date <= Date.new(2017, 12, 31)
    @ref_date = Date.new(2017, 1, 1)
  elsif @latest_date >= Date.new(2018, 1, 1) and @latest_date <= Date.new(2018, 12, 31)
    @ref_date = Date.new(2018, 1, 1)
  end

    
    # binding.pry
    #配列からWhileでloop
    # i = 0
    # while i < ary.length
    #   print ary[i]
    #   i += 1
    # end

   @latest_weight_group_03 = List.select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2').where(weight2: 0.3).where(date: @latest_date)
   
  # @latest_chart_table_weight_group_03 = Table.select('date, color, clar, price').where(weight2: 0.3).group(:date, :color, :clar)
  # @latest_one_week_data = Table.select('date, weight, color, clar, price').where(:date=> @one_week_ago..@latest_date).group(:date, :weight2, :color, :clar)
  # weight_group_03_color_D_IF = @latest_one_week_data.where(weight2: 0.3).where(color: "D").where(clar: "IF")
   
   @latest_chart_index_group = Index.select('date, index1').group(:date)
   @latest_one_year_data = Index.select('date, weight, index1').where(:date=> @ref_date..@latest_date).group(:date)

   
    #0.3_All
    #Date
    # weight_group_03_color_D_IF_date = weight_group_03_color_D_IF.pluck(:date)
    # weight_group_03_color_D_IF_end_price = weight_group_03_color_D_IF.pluck(:price)
    
    one_year_group_date_raw = @latest_one_year_data.pluck(:date)
    
       
      one_year_group_date =[]
      d = 0
      while d < one_year_group_date_raw.length
        date = one_year_group_date_raw[d]
        one_year_group_date << date.to_datetime.utc
        d += 1
      end
     
    
    # one_year_group_date = @latest_one_year_data.pluck(:date)
    
    one_year_group_date_index1 = @latest_one_year_data.pluck(:index1)
    
    @zip_data = one_year_group_date.zip(one_year_group_date_index1)

    # binding.pry
    
    # xAxis: {
    #         type: 'datetime',
    #         dateTimeLabelFormats: {
    #             day: '%e of %b'
    #         }
    #     },
        
    #           series: [{
    #         data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
    #         pointStart: Date.UTC(2010, 0, 1),
    #         pointInterval: 24 * 3600 * 1000 // one day
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.global(useUTC: false)
      @sdate = one_year_group_date.find.first
      @date = one_year_group_date
      f.title(:text => "指標")
      
      f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {month: '%e of %b', year: '%b' }, :title => { text: 'Date'})
      # f.xAxis(:type => 'date', :title => { text: 'Date'})
      # f.xAxis(:type => 'datetime', :dateTimeLabelFormats => { month: '%e of %b'}, :title => { text: 'Date'})
      # f.tooltip(:headerFormat => '<b>{series.name}</b><br>', :pointFormat => '{point.x:%e. %b}: {point.y:.2f} m')
      # f.xAxis(:categories => @date)
      f.yAxis(:title => { text: 'Index(%)' })
      
      # f.xAxis(:categories => weight_group_03_color_D_IF_date)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_IF", :data => weight_group_03_color_D_IF_end_price)
      # f.series(:name => "0.3_D_IF", :data => one_year_group_date_index1)
      # f.series(:name => "Index", :data => one_year_group_date_index1)
      f.series(:name => "Index", :data => @zip_data)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VVS1", :data => weight_group_03_color_D_VVS1_end_price)

      
      f.legend(:align => 'right', :verticalAlign => 'top', :y => 0, :x => -50, :layout => 'vertical',)
      f.chart(type: 'line', height: 600)
      # f.chart({:defaultSeriesType=>"column"})
    end

  end
  
  
  def manage_data
    
    # OrganizeDiamondsJob.perform_later
    # OrganizeDiamondsJob.perform
    # EventWorker.perform_async
    
  end
  

  def create
    @diamond = Diamond.new(diamond_params)
    @diamond.save
    redirect_to root_path , notice: 'データを保存しました'
  end
  
  
  # def chart
  #   @latest_date = Table.maximum(:date)
  #   @oldest_date = Table.minimum(:date)
  #   @one_week_ago = @latest_date - 6
  #   @one_months_ago = @latest_date - 30
  #   @three_months_ago = @latest_date - 90
  #   @six_months_ago = @latest_date - 180
  #   @one_year_ago = @latest_date - 364

  #   #indexページからグラフ描画の引数を取得
  #   weight = params[:q][:weight]
  #   color = params[:q][:color]
  #   clar = params[:q][:clar]
  #   date = params[:q][:date]

  #   if date == "1w"
  #       onw_week_data = Table.where(:date=> @one_week_ago..@latest_date)
  #       # @diamonds = onw_week_data.ransack(:weight_eq => weight).result
  #       # @diamonds = onw_week_data.weight"#{weight}"
  #       @diamonds = onw_week_data.where(:weight2=> weight)
  #     elsif date == "1m"
  #       one_month_data = Table.where(:date=> @one_months_ago..@latest_date)
  #       # @diamonds = one_month_data.ransack(:weight_eq => weight).result
  #       # @diamonds = one_month_data.weight"#{weight}"
  #       @diamonds = one_month_data.where(:weight2=> weight)
  #     elsif date == "3m"
  #       three_month_data = Table.where(:date=> @three_months_ago..@latest_date)
  #       # @diamonds = three_month_data.ransack(:weight_eq => weight).result
  #       @diamonds = three_month_data.where(:weight=> weight)
  #     elsif date == "6m"
  #       six_month_data = Table.where(:date=> @six_months_ago..@latest_date)
  #       # @diamonds = six_month_data.ransack(:weight_eq => weight).result
  #       @diamonds = six_month_data.where(:weight2=> weight)
  #     elsif date == "1y"
  #       one_year_data = Table.where(:date=> @one_year_ago..@latest_date)
  #       # @diamonds = one_year_data.ransack(:weight_eq => weight).result
  #       @diamonds = one_year_data.where(:weight2=> weight)
  #     elsif date == "max"
  #       full_year_data = Table.all
  #       # @diamonds = full_year_data.ransack(:weight_eq => weight).result
  #       @diamonds = full_year_data.where(:weight2=> weight)
  #   end
    
  #   #For ransack
  #   @q = Table.ransack(params[:q])
    
  #   #Weightでソート
  #   # @diamonds = Diamond.ransack(:weight_eq => weight).result(distinct: true)

  #   @diamonds_D = @diamonds.ransack(:color_eq => "D").result
  #   @diamonds_E = @diamonds.ransack(:color_eq => "E").result
  #   @diamonds_F = @diamonds.ransack(:color_eq => "F").result
  #   @diamonds_G = @diamonds.ransack(:color_eq => "G").result
  #   @diamonds_H = @diamonds.ransack(:color_eq => "H").result
  #   @diamonds_I = @diamonds.ransack(:color_eq => "I").result
  #   @diamonds_J = @diamonds.ransack(:color_eq => "J").result
  #   @diamonds_K = @diamonds.ransack(:color_eq => "K").result
  #   @diamonds_L = @diamonds.ransack(:color_eq => "L").result
  #   @diamonds_M = @diamonds.ransack(:color_eq => "M").result
    
  #   #Weight+Colorでソート
  #   @diamonds_color = @diamonds.ransack(:color_eq => color).result
    
  #   g_if_end_price = @diamonds_color.ransack(:clar_eq => "IF").result
  #   g_vvs1_end_price = @diamonds_color.ransack(:clar_eq => "VVS1").result
  #   g_vvs2_end_price = @diamonds_color.ransack(:clar_eq => "VVS2").result
  #   g_vs1_end_price = @diamonds_color.ransack(:clar_eq => "VS1").result
  #   g_vs2_end_price = @diamonds_color.ransack(:clar_eq => "VS2").result
  #   g_si1_end_price = @diamonds_color.ransack(:clar_eq => "SI1").result
  #   g_si2_end_price = @diamonds_color.ransack(:clar_eq => "SI2").result

  #   @weight_color_group_if = g_if_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_vvs1 = g_vvs1_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_vvs2 = g_vvs2_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_vs1 = g_vs1_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_vs2 = g_vs2_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_si1 = g_si1_end_price.select("date, color, clar, price").group(:date)
  #   @weight_color_group_si2 = g_si2_end_price.select("date, color, clar, price").group(:date)

  #   #Date
  #   group_IF_date = []
  #   group_VVS1_date = []
  #   group_VVS2_date = []
  #   group_VS1_date = []
  #   group_VS2_date = []
  #   group_SI1_date = []
  #   group_SI2_date = []

  #   @weight_color_group_if.each do |diamond|
  #     group_IF_date << diamond.date
  #   end

  #   @weight_color_group_vvs1.each do |diamond|
  #     group_VVS1_date << diamond.date
  #   end

  #   @weight_color_group_vvs2.each do |diamond|
  #     group_VVS2_date << diamond.date
  #   end

  #   @weight_color_group_vs1.each do |diamond|
  #     group_VS1_date << diamond.date
  #   end

  #   @weight_color_group_vs2.each do |diamond|
  #     group_VS2_date << diamond.date
  #   end

  #   @weight_color_group_si1.each do |diamond|
  #     group_SI1_date << diamond.date
  #   end

  #   @weight_color_group_si2.each do |diamond|
  #     group_SI2_date << diamond.date
  #   end

  #   if_end_price = []
  #   vvs1_end_price = []
  #   vvs2_end_price = []
  #   vs1_end_price = []
  #   vs2_end_price = []
  #   si1_end_price = []
  #   si2_end_price = []

  #   @weight_color_group_if.each do |diamond|
  #     # if_end_price << diamond.avg_price.round
  #     if_end_price << diamond.price
  #   end

  #   @weight_color_group_vvs1.each do |diamond|
  #     vvs1_end_price << diamond.price
  #   end

  #   @weight_color_group_vvs2.each do |diamond|
  #     vvs2_end_price << diamond.price
  #   end

  #   @weight_color_group_vs1.each do |diamond|
  #     vs1_end_price << diamond.price
  #   end

  #   @weight_color_group_vs2.each do |diamond|
  #     vs2_end_price << diamond.price
  #   end

  #   @weight_color_group_si1.each do |diamond|
  #     si1_end_price << diamond.price
  #   end

  #   @weight_color_group_si2.each do |diamond|
  #     si2_end_price << diamond.price
  #   end

  #   #Weight+Color+clarでソート
  #   @diamonds_clar = @diamonds_color.ransack(:clar_eq => clar).result
    
  #   @g_clar_end_price = @diamonds_clar.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)

  #   clar_end_price = []
  #   @g_clar_end_price.each do |diamond|
  #     clar_end_price << diamond.price
  #   end

  #   # binding.pry
    
  #   #Date
  #   # date2 = @diamonds.pluck(:date)
    
  #   #color_D
  #   g_color_D_IF_end_price = @diamonds_D.ransack(:clar_eq => "IF").result
  #   g_color_D_VVS1_end_price = @diamonds_D.ransack(:clar_eq => "VVS1").result
  #   g_color_D_VVS2_end_price = @diamonds_D.ransack(:clar_eq => "VVS2").result
  #   g_color_D_VS1_end_price = @diamonds_D.ransack(:clar_eq => "VS1").result
  #   g_color_D_VS2_end_price = @diamonds_D.ransack(:clar_eq => "VS2").result
  #   g_color_D_SI1_end_price = @diamonds_D.ransack(:clar_eq => "SI1").result
  #   g_color_D_SI2_end_price = @diamonds_D.ransack(:clar_eq => "SI2").result

  #   @color_D_group_if = g_color_D_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_vvs1 = g_color_D_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_vvs2 = g_color_D_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_vs1 = g_color_D_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_vs2 = g_color_D_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_si1 = g_color_D_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_D_group_si2 = g_color_D_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_D_IF_end_price = []
  #   color_D_VVS1_end_price = []
  #   color_D_VVS2_end_price = []
  #   color_D_VS1_end_price = []
  #   color_D_VS2_end_price = []
  #   color_D_SI1_end_price = []
  #   color_D_SI2_end_price = []

  #   @color_D_group_if.each do |diamond|
  #     color_D_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_vvs1.each do |diamond|
  #     color_D_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_vvs2.each do |diamond|
  #     color_D_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_vs1.each do |diamond|
  #     color_D_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_vs2.each do |diamond|
  #     color_D_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_si1.each do |diamond|
  #     color_D_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_D_group_si2.each do |diamond|
  #     color_D_SI2_end_price << diamond.avg_price.round
  #   end

  #   #color_E
  #   g_color_E_IF_end_price = @diamonds_E.ransack(:clar_eq => "IF").result
  #   g_color_E_VVS1_end_price = @diamonds_E.ransack(:clar_eq => "VVS1").result
  #   g_color_E_VVS2_end_price = @diamonds_E.ransack(:clar_eq => "VVS2").result
  #   g_color_E_VS1_end_price = @diamonds_E.ransack(:clar_eq => "VS1").result
  #   g_color_E_VS2_end_price = @diamonds_E.ransack(:clar_eq => "VS2").result
  #   g_color_E_SI1_end_price = @diamonds_E.ransack(:clar_eq => "SI1").result
  #   g_color_E_SI2_end_price = @diamonds_E.ransack(:clar_eq => "SI2").result

  #   @color_E_group_if = g_color_E_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_vvs1 = g_color_E_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_vvs2 = g_color_E_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_vs1 = g_color_E_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_vs2 = g_color_E_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_si1 = g_color_E_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_E_group_si2 = g_color_E_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_E_IF_end_price = []
  #   color_E_VVS1_end_price = []
  #   color_E_VVS2_end_price = []
  #   color_E_VS1_end_price = []
  #   color_E_VS2_end_price = []
  #   color_E_SI1_end_price = []
  #   color_E_SI2_end_price = []

  #   @color_E_group_if.each do |diamond|
  #     color_E_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_vvs1.each do |diamond|
  #     color_E_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_vvs2.each do |diamond|
  #     color_E_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_vs1.each do |diamond|
  #     color_E_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_vs2.each do |diamond|
  #     color_E_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_si1.each do |diamond|
  #     color_E_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_E_group_si2.each do |diamond|
  #     color_E_SI2_end_price << diamond.avg_price.round
  #   end
    
  #   #color_F
  #   g_color_F_IF_end_price = @diamonds_F.ransack(:clar_eq => "IF").result
  #   g_color_F_VVS1_end_price = @diamonds_F.ransack(:clar_eq => "VVS1").result
  #   g_color_F_VVS2_end_price = @diamonds_F.ransack(:clar_eq => "VVS2").result
  #   g_color_F_VS1_end_price = @diamonds_F.ransack(:clar_eq => "VS1").result
  #   g_color_F_VS2_end_price = @diamonds_F.ransack(:clar_eq => "VS2").result
  #   g_color_F_SI1_end_price = @diamonds_F.ransack(:clar_eq => "SI1").result
  #   g_color_F_SI2_end_price = @diamonds_F.ransack(:clar_eq => "SI2").result

  #   @color_F_group_if = g_color_F_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_vvs1 = g_color_F_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_vvs2 = g_color_F_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_vs1 = g_color_F_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_vs2 = g_color_F_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_si1 = g_color_F_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_F_group_si2 = g_color_F_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_F_IF_end_price = []
  #   color_F_VVS1_end_price = []
  #   color_F_VVS2_end_price = []
  #   color_F_VS1_end_price = []
  #   color_F_VS2_end_price = []
  #   color_F_SI1_end_price = []
  #   color_F_SI2_end_price = []

  #   @color_F_group_if.each do |diamond|
  #     color_F_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_vvs1.each do |diamond|
  #     color_F_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_vvs2.each do |diamond|
  #     color_F_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_vs1.each do |diamond|
  #     color_F_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_vs2.each do |diamond|
  #     color_F_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_si1.each do |diamond|
  #     color_F_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_F_group_si2.each do |diamond|
  #     color_F_SI2_end_price << diamond.avg_price.round
  #   end
    
  #   #color_G
  #   g_color_G_IF_end_price = @diamonds_G.ransack(:clar_eq => "IF").result
  #   g_color_G_VVS1_end_price = @diamonds_G.ransack(:clar_eq => "VVS1").result
  #   g_color_G_VVS2_end_price = @diamonds_G.ransack(:clar_eq => "VVS2").result
  #   g_color_G_VS1_end_price = @diamonds_G.ransack(:clar_eq => "VS1").result
  #   g_color_G_VS2_end_price = @diamonds_G.ransack(:clar_eq => "VS2").result
  #   g_color_G_SI1_end_price = @diamonds_G.ransack(:clar_eq => "SI1").result
  #   g_color_G_SI2_end_price = @diamonds_G.ransack(:clar_eq => "SI2").result

  #   @color_G_group_if = g_color_G_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_vvs1 = g_color_G_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_vvs2 = g_color_G_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_vs1 = g_color_G_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_vs2 = g_color_G_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_si1 = g_color_G_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_G_group_si2 = g_color_G_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_G_IF_end_price = []
  #   color_G_VVS1_end_price = []
  #   color_G_VVS2_end_price = []
  #   color_G_VS1_end_price = []
  #   color_G_VS2_end_price = []
  #   color_G_SI1_end_price = []
  #   color_G_SI2_end_price = []

  #   @color_G_group_if.each do |diamond|
  #     color_G_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_vvs1.each do |diamond|
  #     color_G_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_vvs2.each do |diamond|
  #     color_G_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_vs1.each do |diamond|
  #     color_G_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_vs2.each do |diamond|
  #     color_G_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_si1.each do |diamond|
  #     color_G_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_G_group_si2.each do |diamond|
  #     color_G_SI2_end_price << diamond.avg_price.round
  #   end

    
  #   #color_H
  #   g_color_H_IF_end_price = @diamonds_H.ransack(:clar_eq => "IF").result
  #   g_color_H_VVS1_end_price = @diamonds_H.ransack(:clar_eq => "VVS1").result
  #   g_color_H_VVS2_end_price = @diamonds_H.ransack(:clar_eq => "VVS2").result
  #   g_color_H_VS1_end_price = @diamonds_H.ransack(:clar_eq => "VS1").result
  #   g_color_H_VS2_end_price = @diamonds_H.ransack(:clar_eq => "VS2").result
  #   g_color_H_SI1_end_price = @diamonds_H.ransack(:clar_eq => "SI1").result
  #   g_color_H_SI2_end_price = @diamonds_H.ransack(:clar_eq => "SI2").result

  #   @color_H_group_if = g_color_H_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_vvs1 = g_color_H_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_vvs2 = g_color_H_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_vs1 = g_color_H_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_vs2 = g_color_H_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_si1 = g_color_H_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_H_group_si2 = g_color_H_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_H_IF_end_price = []
  #   color_H_VVS1_end_price = []
  #   color_H_VVS2_end_price = []
  #   color_H_VS1_end_price = []
  #   color_H_VS2_end_price = []
  #   color_H_SI1_end_price = []
  #   color_H_SI2_end_price = []

  #   @color_H_group_if.each do |diamond|
  #     color_H_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_vvs1.each do |diamond|
  #     color_H_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_vvs2.each do |diamond|
  #     color_H_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_vs1.each do |diamond|
  #     color_H_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_vs2.each do |diamond|
  #     color_H_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_si1.each do |diamond|
  #     color_H_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_H_group_si2.each do |diamond|
  #     color_H_SI2_end_price << diamond.avg_price.round
  #   end

    
  #   #color_I
  #   g_color_I_IF_end_price = @diamonds_I.ransack(:clar_eq => "IF").result
  #   g_color_I_VVS1_end_price = @diamonds_I.ransack(:clar_eq => "VVS1").result
  #   g_color_I_VVS2_end_price = @diamonds_I.ransack(:clar_eq => "VVS2").result
  #   g_color_I_VS1_end_price = @diamonds_I.ransack(:clar_eq => "VS1").result
  #   g_color_I_VS2_end_price = @diamonds_I.ransack(:clar_eq => "VS2").result
  #   g_color_I_SI1_end_price = @diamonds_I.ransack(:clar_eq => "SI1").result
  #   g_color_I_SI2_end_price = @diamonds_I.ransack(:clar_eq => "SI2").result

  #   @color_I_group_if = g_color_I_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_vvs1 = g_color_I_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_vvs2 = g_color_I_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_vs1 = g_color_I_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_vs2 = g_color_I_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_si1 = g_color_I_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_I_group_si2 = g_color_I_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_I_IF_end_price = []
  #   color_I_VVS1_end_price = []
  #   color_I_VVS2_end_price = []
  #   color_I_VS1_end_price = []
  #   color_I_VS2_end_price = []
  #   color_I_SI1_end_price = []
  #   color_I_SI2_end_price = []

  #   @color_I_group_if.each do |diamond|
  #     color_I_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_vvs1.each do |diamond|
  #     color_I_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_vvs2.each do |diamond|
  #     color_I_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_vs1.each do |diamond|
  #     color_I_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_vs2.each do |diamond|
  #     color_I_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_si1.each do |diamond|
  #     color_I_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_I_group_si2.each do |diamond|
  #     color_I_SI2_end_price << diamond.avg_price.round
  #   end

    
  #   #color_J
  #   g_color_J_IF_end_price = @diamonds_J.ransack(:clar_eq => "IF").result
  #   g_color_J_VVS1_end_price = @diamonds_J.ransack(:clar_eq => "VVS1").result
  #   g_color_J_VVS2_end_price = @diamonds_J.ransack(:clar_eq => "VVS2").result
  #   g_color_J_VS1_end_price = @diamonds_J.ransack(:clar_eq => "VS1").result
  #   g_color_J_VS2_end_price = @diamonds_J.ransack(:clar_eq => "VS2").result
  #   g_color_J_SI1_end_price = @diamonds_J.ransack(:clar_eq => "SI1").result
  #   g_color_J_SI2_end_price = @diamonds_J.ransack(:clar_eq => "SI2").result

  #   @color_J_group_if = g_color_J_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_vvs1 = g_color_J_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_vvs2 = g_color_J_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_vs1 = g_color_J_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_vs2 = g_color_J_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_si1 = g_color_J_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_J_group_si2 = g_color_J_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_J_IF_end_price = []
  #   color_J_VVS1_end_price = []
  #   color_J_VVS2_end_price = []
  #   color_J_VS1_end_price = []
  #   color_J_VS2_end_price = []
  #   color_J_SI1_end_price = []
  #   color_J_SI2_end_price = []

  #   @color_J_group_if.each do |diamond|
  #     color_J_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_vvs1.each do |diamond|
  #     color_J_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_vvs2.each do |diamond|
  #     color_J_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_vs1.each do |diamond|
  #     color_J_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_vs2.each do |diamond|
  #     color_J_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_si1.each do |diamond|
  #     color_J_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_J_group_si2.each do |diamond|
  #     color_J_SI2_end_price << diamond.avg_price.round
  #   end

    
  #   #color_K
  #   g_color_K_IF_end_price = @diamonds_K.ransack(:clar_eq => "IF").result
  #   g_color_K_VVS1_end_price = @diamonds_K.ransack(:clar_eq => "VVS1").result
  #   g_color_K_VVS2_end_price = @diamonds_K.ransack(:clar_eq => "VVS2").result
  #   g_color_K_VS1_end_price = @diamonds_K.ransack(:clar_eq => "VS1").result
  #   g_color_K_VS2_end_price = @diamonds_K.ransack(:clar_eq => "VS2").result
  #   g_color_K_SI1_end_price = @diamonds_K.ransack(:clar_eq => "SI1").result
  #   g_color_K_SI2_end_price = @diamonds_K.ransack(:clar_eq => "SI2").result

  #   @color_K_group_if = g_color_K_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_vvs1 = g_color_K_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_vvs2 = g_color_K_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_vs1 = g_color_K_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_vs2 = g_color_K_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_si1 = g_color_K_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_K_group_si2 = g_color_K_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_K_IF_end_price = []
  #   color_K_VVS1_end_price = []
  #   color_K_VVS2_end_price = []
  #   color_K_VS1_end_price = []
  #   color_K_VS2_end_price = []
  #   color_K_SI1_end_price = []
  #   color_K_SI2_end_price = []

  #   @color_K_group_if.each do |diamond|
  #     color_K_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_vvs1.each do |diamond|
  #     color_K_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_vvs2.each do |diamond|
  #     color_K_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_vs1.each do |diamond|
  #     color_K_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_vs2.each do |diamond|
  #     color_K_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_si1.each do |diamond|
  #     color_K_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_K_group_si2.each do |diamond|
  #     color_K_SI2_end_price << diamond.avg_price.round
  #   end

    
  #   #color_L
  #   g_color_L_IF_end_price = @diamonds_L.ransack(:clar_eq => "IF").result
  #   g_color_L_VVS1_end_price = @diamonds_L.ransack(:clar_eq => "VVS1").result
  #   g_color_L_VVS2_end_price = @diamonds_L.ransack(:clar_eq => "VVS2").result
  #   g_color_L_VS1_end_price = @diamonds_L.ransack(:clar_eq => "VS1").result
  #   g_color_L_VS2_end_price = @diamonds_L.ransack(:clar_eq => "VS2").result
  #   g_color_L_SI1_end_price = @diamonds_L.ransack(:clar_eq => "SI1").result
  #   g_color_L_SI2_end_price = @diamonds_L.ransack(:clar_eq => "SI2").result

  #   @color_L_group_if = g_color_L_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_vvs1 = g_color_L_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_vvs2 = g_color_L_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_vs1 = g_color_L_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_vs2 = g_color_L_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_si1 = g_color_L_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_L_group_si2 = g_color_L_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_L_IF_end_price = []
  #   color_L_VVS1_end_price = []
  #   color_L_VVS2_end_price = []
  #   color_L_VS1_end_price = []
  #   color_L_VS2_end_price = []
  #   color_L_SI1_end_price = []
  #   color_L_SI2_end_price = []

  #   @color_L_group_if.each do |diamond|
  #     color_L_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_vvs1.each do |diamond|
  #     color_L_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_vvs2.each do |diamond|
  #     color_L_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_vs1.each do |diamond|
  #     color_L_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_vs2.each do |diamond|
  #     color_L_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_si1.each do |diamond|
  #     color_L_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_L_group_si2.each do |diamond|
  #     color_L_SI2_end_price << diamond.avg_price.round
  #   end
    
  #   #color_M
  #   g_color_M_IF_end_price = @diamonds_M.ransack(:clar_eq => "IF").result
  #   g_color_M_VVS1_end_price = @diamonds_M.ransack(:clar_eq => "VVS1").result
  #   g_color_M_VVS2_end_price = @diamonds_M.ransack(:clar_eq => "VVS2").result
  #   g_color_M_VS1_end_price = @diamonds_M.ransack(:clar_eq => "VS1").result
  #   g_color_M_VS2_end_price = @diamonds_M.ransack(:clar_eq => "VS2").result
  #   g_color_M_SI1_end_price = @diamonds_M.ransack(:clar_eq => "SI1").result
  #   g_color_M_SI2_end_price = @diamonds_M.ransack(:clar_eq => "SI2").result

  #   @color_M_group_if = g_color_M_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_vvs1 = g_color_M_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_vvs2 = g_color_M_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_vs1 = g_color_M_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_vs2 = g_color_M_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_si1 = g_color_M_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
  #   @color_M_group_si2 = g_color_M_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
  #   color_M_IF_end_price = []
  #   color_M_VVS1_end_price = []
  #   color_M_VVS2_end_price = []
  #   color_M_VS1_end_price = []
  #   color_M_VS2_end_price = []
  #   color_M_SI1_end_price = []
  #   color_M_SI2_end_price = []

  #   @color_M_group_if.each do |diamond|
  #     color_M_IF_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_vvs1.each do |diamond|
  #     color_M_VVS1_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_vvs2.each do |diamond|
  #     color_M_VVS2_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_vs1.each do |diamond|
  #     color_M_VS1_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_vs2.each do |diamond|
  #     color_M_VS2_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_si1.each do |diamond|
  #     color_M_SI1_end_price << diamond.avg_price.round
  #   end

  #   @color_M_group_si2.each do |diamond|
  #     color_M_SI2_end_price << diamond.avg_price.round
  #   end

    

  #   # binding.pry
  #   @chart = LazyHighCharts::HighChart.new('graph') do |f|
  #     # binding.pry
  
  #     if color == "all" and clar == "all"
  #       #カラット別で表示
  #         f.title(:text => "Diamond Price Chart #{weight}カラット")
  #         f.xAxis(:categories => group_IF_date)
  #         f.yAxis(:title => { text: 'Diamond Price($)' })
  #         #D_
  #         f.series(:name => "D_IF", :data => color_D_IF_end_price)
  #         f.series(:name => "D_VVS1", :data => color_D_VVS1_end_price)
  #         f.series(:name => "D_VVS2", :data => color_D_VVS2_end_price)
  #         f.series(:name => "D_VS1", :data => color_D_VS1_end_price)
  #         f.series(:name => "D_VS2", :data => color_D_VS2_end_price)
  #         f.series(:name => "D_SI1", :data => color_D_SI1_end_price)
  #         f.series(:name => "D_SI2", :data => color_D_SI2_end_price)
          
  #         #E_
  #         f.series(:name => "E_IF", :data => color_E_IF_end_price)
  #         f.series(:name => "E_VVS1", :data => color_E_VVS1_end_price)
  #         f.series(:name => "E_VVS2", :data => color_E_VVS2_end_price)
  #         f.series(:name => "E_VS1", :data => color_E_VS1_end_price)
  #         f.series(:name => "E_VS2", :data => color_E_VS2_end_price)
  #         f.series(:name => "E_SI1", :data => color_E_SI1_end_price)
  #         f.series(:name => "E_SI2", :data => color_E_SI2_end_price)
          
  #         #F_
  #         f.series(:name => "F_IF", :data => color_F_IF_end_price)
  #         f.series(:name => "F_VVS1", :data => color_F_VVS1_end_price)
  #         f.series(:name => "F_VVS2", :data => color_F_VVS2_end_price)
  #         f.series(:name => "F_VS1", :data => color_F_VS1_end_price)
  #         f.series(:name => "F_VS2", :data => color_F_VS2_end_price)
  #         f.series(:name => "F_SI1", :data => color_F_SI1_end_price)
  #         f.series(:name => "F_SI2", :data => color_F_SI2_end_price)
          
  #         #G_
  #         f.series(:name => "G_IF", :data => color_G_IF_end_price)
  #         f.series(:name => "G_VVS1", :data => color_G_VVS1_end_price)
  #         f.series(:name => "G_VVS2", :data => color_G_VVS2_end_price)
  #         f.series(:name => "G_VS1", :data => color_G_VS1_end_price)
  #         f.series(:name => "G_VS2", :data => color_G_VS2_end_price)
  #         f.series(:name => "G_SI1", :data => color_G_SI1_end_price)
  #         f.series(:name => "G_SI2", :data => color_G_SI2_end_price)
          
  #         #H_
  #         f.series(:name => "H_IF", :data => color_H_IF_end_price)
  #         f.series(:name => "H_VVS1", :data => color_H_VVS1_end_price)
  #         f.series(:name => "H_VVS2", :data => color_H_VVS2_end_price)
  #         f.series(:name => "H_VS1", :data => color_H_VS1_end_price)
  #         f.series(:name => "H_VS2", :data => color_H_VS2_end_price)
  #         f.series(:name => "H_SI1", :data => color_H_SI1_end_price)
  #         f.series(:name => "H_SI2", :data => color_H_SI2_end_price)
          
  #         #I_
  #         f.series(:name => "I_IF", :data => color_I_IF_end_price)
  #         f.series(:name => "I_VVS1", :data => color_I_VVS1_end_price)
  #         f.series(:name => "I_VVS2", :data => color_I_VVS2_end_price)
  #         f.series(:name => "I_VS1", :data => color_I_VS1_end_price)
  #         f.series(:name => "I_VS2", :data => color_I_VS2_end_price)
  #         f.series(:name => "I_SI1", :data => color_I_SI1_end_price)
  #         f.series(:name => "I_SI2", :data => color_I_SI2_end_price)
          
  #         #J_
  #         f.series(:name => "J_IF", :data => color_J_IF_end_price)
  #         f.series(:name => "J_VVS1", :data => color_J_VVS1_end_price)
  #         f.series(:name => "J_VVS2", :data => color_J_VVS2_end_price)
  #         f.series(:name => "J_VS1", :data => color_J_VS1_end_price)
  #         f.series(:name => "J_VS2", :data => color_J_VS2_end_price)
  #         f.series(:name => "J_SI1", :data => color_J_SI1_end_price)
  #         f.series(:name => "J_SI2", :data => color_J_SI2_end_price)
          
  #         #K_
  #         f.series(:name => "K_IF", :data => color_K_IF_end_price)
  #         f.series(:name => "K_VVS1", :data => color_K_VVS1_end_price)
  #         f.series(:name => "K_VVS2", :data => color_K_VVS2_end_price)
  #         f.series(:name => "K_VS1", :data => color_K_VS1_end_price)
  #         f.series(:name => "K_VS2", :data => color_K_VS2_end_price)
  #         f.series(:name => "K_SI1", :data => color_K_SI1_end_price)
  #         f.series(:name => "K_SI2", :data => color_K_SI2_end_price)
          
  #         #L_
  #         f.series(:name => "L_IF", :data => color_L_IF_end_price)
  #         f.series(:name => "L_VVS1", :data => color_L_VVS1_end_price)
  #         f.series(:name => "L_VVS2", :data => color_L_VVS2_end_price)
  #         f.series(:name => "L_VS1", :data => color_L_VS1_end_price)
  #         f.series(:name => "L_VS2", :data => color_L_VS2_end_price)
  #         f.series(:name => "L_SI1", :data => color_L_SI1_end_price)
  #         f.series(:name => "L_SI2", :data => color_L_SI2_end_price)
          
  #         #M_
  #         f.series(:name => "M_IF", :data => color_M_IF_end_price)
  #         f.series(:name => "M_VVS1", :data => color_M_VVS1_end_price)
  #         f.series(:name => "M_VVS2", :data => color_M_VVS2_end_price)
  #         f.series(:name => "M_VS1", :data => color_M_VS1_end_price)
  #         f.series(:name => "M_VS2", :data => color_M_VS2_end_price)
  #         f.series(:name => "M_SI1", :data => color_M_SI1_end_price)
  #         f.series(:name => "M_SI2", :data => color_M_SI2_end_price)
          
          
  #         f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
  #         f.chart(type: 'line', height: 600)
  #         # f.chart({:defaultSeriesType=>"column"})
    
  #       elsif color != "all" and clar == "all"
  #         f.title(:text => "Diamond Price Chart #{weight}カラット")
  #         f.xAxis(:categories => group_IF_date)
  #         f.yAxis(:title => { text: 'Diamond Price($)' })
          
  #         f.series(:name => "#{color}_IF", :data => if_end_price)
  #         f.series(:name => "#{color}_VVS1", :data => if_end_price)
  #         f.series(:name => "#{color}_VVS2", :data => vvs2_end_price)
  #         f.series(:name => "#{color}_VS1", :data => vs1_end_price)
  #         f.series(:name => "#{color}_VS2", :data => vs2_end_price)
  #         f.series(:name => "#{color}_SI1", :data => si1_end_price)
  #         f.series(:name => "#{color}_SI2", :data => si2_end_price)
          
  #         f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
  #         f.chart(type: 'line', height: 600)
   
  #       elsif  color != "all" and clar != "all"
  #         f.title(:text => "Diamond Price Chart #{weight}カラット")
  #         f.xAxis(:categories => group_IF_date)
  #         f.yAxis(:title => { text: 'Diamond Price($)' })
          
  #         f.series(:name => "#{color}_#{clar}", :data => clar_end_price)
  #         f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
  #         f.chart(type: 'line', height: 600)
      
  #     end
  #   end  
    
  # end
  
  private
  def diamond_params
    params.require(:diamond).permit(:date, :weight2, :clar, :end_price, :color, :cut_grade, :rapnet_list_price, 
                                    :rapnet_discount, :price_per_carat, :polish, :symmetry, :fluorescen)
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
  
  
  
  
end
