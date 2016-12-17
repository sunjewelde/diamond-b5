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
    redirect_to root_url, notice: "Diamondデータの追加を開始しました。"
    @file = params[:file].path
    options = {:col_sep => ',', :row_sep => :auto, :remove_empty_values => false,
    :remove_empty_hashes => false, :file_encoding  => 'iso-8859-1'}
      SmarterCSV.process(@file, options) do |chunk|
        CsvImportJob.perform_later(chunk)
      end
    
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
  # @cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
   @cut_grade = ["Good", "Very Good", "VGD", "Excellent", "EXC"]
   @polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
   @symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
  # @fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
  #               "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]
   @fluorescen = ["Medium", "Faint", "f", "FT", "None", "NONE", "Strong", "st", "Medium Blue", "M.BLUE", "mb", "md blue", "str blue", "sb", "S.BLUE", "Very Strong", "VST", "V.S.BLUE"]
   

   #最新旧の日付を取得
  @latest_date = Table.maximum(:date)
  @oldest_date = Table.minimum(:date)
  if @latest_date.present?
    @one_week_ago = @latest_date - 6
  end
  
  @ref_date = Date.new(2015, 1, 1)
  
  # if @latest_date.present?
  #     if @latest_date <= Date.new(2015, 12, 31)
  #       @ref_date = Date.new(2015, 1, 1)
  #     elsif @latest_date >= Date.new(2016, 1, 1) and @latest_date <= Date.new(2016, 12, 31)
  #       @ref_date = Date.new(2016, 1, 1)
  #     elsif @latest_date >= Date.new(2017, 1, 1) and @latest_date <= Date.new(2017, 12, 31)
  #       @ref_date = Date.new(2017, 1, 1)
  #     elsif @latest_date >= Date.new(2018, 1, 1) and @latest_date <= Date.new(2018, 12, 31)
  #       @ref_date = Date.new(2018, 1, 1)
  #     end
  # end
  

    
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
   @latest_one_year_data = Index.select('date, index1').where(:date=> @ref_date..@latest_date).group(:date)

   
    #0.3_All
    #Date
    # weight_group_03_color_D_IF_date = weight_group_03_color_D_IF.pluck(:date)
    # weight_group_03_color_D_IF_end_price = weight_group_03_color_D_IF.pluck(:price)
    
    # time.strftime('%Y-%m-%d %H:%M:%S')
    
    one_year_group_date_raw = @latest_one_year_data.pluck(:date)
    one_year_group_date = one_year_group_date_raw.map {|date| date.to_datetime.utc.to_i*1000}
       
      # Time.utc(2011,01,01).to_i * 1000
       
      # one_year_group_date =[]
      # d = 0
      # while d < one_year_group_date_raw.length
      #   date = one_year_group_date_raw[d]
      #   # date_format = date.to_datetime.strftime('%Y,%m,%d')
      #   # date_format2 =Time.utc(date_format).to_1*1000
      #   # one_year_group_date << date_format2
      #   one_year_group_date << date.to_datetime.utc.to_i*1000
      #   # one_year_group_date << date.to_datetime.to_i
      #   # one_year_group_date << date.to_datetime.strftime('%Y-%m-%d %H:%M:%S')
      #   # one_year_group_date << date.to_datetime.strftime('%m %d %Y %H:%M')
      #   # one_year_group_date << date.to_datetime.strftime('%Y-%m-%d')
      #   # one_year_group_date << date.to_date.utc
      #   d += 1
      # end
     
    
    
    one_year_group_date_index1 = @latest_one_year_data.pluck(:index1)
    one_year_group_date_index2 = @latest_one_year_data.pluck(:index2)
    one_year_group_date_index3 = @latest_one_year_data.pluck(:index3)
    one_year_group_date_index4 = @latest_one_year_data.pluck(:index4)
    
    @zip_data_index1 = one_year_group_date.zip(one_year_group_date_index1)
    @zip_data_index2 = one_year_group_date.zip(one_year_group_date_index2)
    @zip_data_index3 = one_year_group_date.zip(one_year_group_date_index3)
    @zip_data_index4 = one_year_group_date.zip(one_year_group_date_index4)

    # binding.pry
    
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.global(useUTC: false)
      @sdate = one_year_group_date.find.first
      @date = one_year_group_date
      # f.title(:text => "指標")
      
      # f.xAxis(:type => 'datetime', :title => { text: 'Date'})
      f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {day: '%e. %b', month: '%b' }, :title => { text: 'Date'})
      # f.xAxis(:type => 'datetime', :dateTimeLabelFormats => {second: '%l:%M:%S %p',
      #                         minute: '%l:%M %p', 
      #                         hour: '%l:%M %p',
      #                         day: '%e. %b', week: '%e. %b', 
      #                         month: '%b \'%y', year: '%Y'}, :title => { text: 'Date'})
      # f.xAxis(:type => 'datetime', :dateTimeLabelFormats => { month: '%e of %b'}, :title => { text: 'Date'})
      # f.tooltip(:headerFormat => '<b>{series.name}</b><br>', :pointFormat => '{point.x:%e. %b}: {point.y:.2f} m')
      # f.xAxis(:categories => @date)
      f.yAxis(:title => { text: 'Index(%)' })
      
      # f.xAxis(:categories => weight_group_03_color_D_IF_date)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_IF", :data => weight_group_03_color_D_IF_end_price)
      # f.series(:name => "0.3_D_IF", :data => one_year_group_date_index1)
      # f.series(:name => "Index", :data => one_year_group_date_index1)
      
      f.series(:name => "ダイヤモンドIndex", :data => @zip_data_index4, :marker => {enabled: false})
      f.series(:name => "ダイヤモンド単価Index", :data => @zip_data_index1, :marker => {enabled: false})

      
      # f.series(:name => "JPIndex", :data => @zip_data_index3)
      
      
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VVS1", :data => weight_group_03_color_D_VVS1_end_price)

      
      # f.legend(:align => 'right', :verticalAlign => 'top', :y => 0, :x => -50, :layout => 'vertical',)
      f.legend(:align => 'left', :floating => true, :verticalAlign => 'top', :y => 1, :x => 90, :layout => 'vertical',)
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
