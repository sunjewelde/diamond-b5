class Diamond <ActiveRecord::Base

    # require 'rubygems'
    # require 'active_support'
    require "date"
    
    # @latest_date = Diamond.maximum(:date)
    # @oldest_date = Diamond.minimum(:date)
    # @weight_max = Diamond.maximum(:weight)
    # @weight_min = Diamond.minimum(:weight)
    
    # @latest_date = self.maximum(:date)
    # @oldest_date = self.minimum(:date)
    @weight_max = self.maximum(:weight)
    @weight_min = self.minimum(:weight)

    # if @latest_date.present?
    #   @one_week_ago = (@latest_date - 6)
    #   @one_months_ago = (@latest_date - 30)
    #   @three_months_ago = (@latest_date - 90)
    #   @six_months_ago = (@latest_date - 180)
    #   @one_year_ago = (@latest_date - 364)
    # end
    
   #7days agoの日付が存在しない場合の対処

    # scope :date_one_week, -> {where(:date=> @one_week_ago..@latest_date)}
    # scope :date_one_month, -> {where(:date=> @one_months_ago..@latest_date)}
    # scope :date_three_month, -> {where(:date=> @three_months_ago..@latest_date)}
    # scope :date_six_month, -> {where(:date=> @six_months_ago..@latest_date)}
    # scope :date_one_year, -> {where(:date=> @one_year_ago..@latest_date)}
    # scope :date_full_year, -> {where(:date=> @oldest_date..@latest_date)} 
    scope :weight, ->(weight) {where(weight: weight)}

    # scope :date_bewteen, -> from, to {
    #   if from.present? && to.present?
    #       where(date: from..to)
    #     elsif from.present?
    #       where('date >= ?', from)
    #     elsif to.present?
    #       where('date <= ?', to)
    #   end
    #   }

    scope :color, ->(color) {where(color: color) if color.present? }
    scope :clar, ->(clar) {where(clar: clar) if clar.present? }
    scope :date, ->(date) {where(date: date) if date.present? }
    scope :cut_grade, ->(cut_grade) {where(cut_grade: cut_grade) if cut_grade.present? }
    scope :polish, ->(polish) {where(polish: polish) if polish.present?}
    scope :symmetry, ->(symmetry) {where(symmetry: symmetry) if symmetry.present? }
    scope :fluorescen, ->(fluorescen) {where(fluorescen: fluorescen) if fluorescen.present? }
    scope :certificate_id, ->(certificate_id) {where(certificate_id: certificate_id) if color.present? }
    scope :end_price, ->(end_price) {where(end_price: end_price) if end_price.present? }

    scope :weight02, -> {where(:weight=> @weight_min...0.3 ) }
    scope :weight03, -> {where(:weight=> 0.3...0.4 ) }
    scope :weight04, -> {where(:weight=> 0.4...0.5 ) }
    scope :weight05, -> {where(:weight=> 0.5...0.6 ) }
    scope :weight06, -> {where(:weight=> 0.6...0.7 ) }
    scope :weight07, -> {where(:weight=> 0.7...0.8 ) }
    scope :weight08, -> {where(:weight=> 0.8...0.9 ) }
    scope :weight09, -> {where(:weight=> 0.9...1.0 ) }
    scope :weight10, -> {where(:weight=> 1.0...1.2 ) }
    scope :weight12, -> {where(:weight=> 1.2...1.5 ) }
    scope :weight15, -> {where(:weight=> 1.5...1.8 ) }
    scope :weight18, -> {where(:weight=> 1.8...2.0 ) }
    scope :weight20, -> {where(:weight=> 2.0...3.0 ) }
    scope :weight30, -> {where(:weight=> 3.0...4.0 ) }
    scope :weight40, -> {where(:weight=> 4.0..@weight_max ) }


  def self.import(file)
  # CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
  # Diamond.create(:date => row[0], :weight => row[4], :color => row[5], :clar => row[9], :length => row[10], :width => row[11],
  #               :depth => row[12], :cut_grade => row[14], :rapnet_list_price => row[16], :rapnet_discount => row[17], :price_per_carat => row[18], 
  #               :polish => row[26], :symmetry => row[27], :fluorescen => row[28], :certificate_id => row[37], :end_price => row[48])
  #   end
  end
  
  def task(file)
  end
  

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["date", "weight", "color", "clar", "cut_grade", "rapnet_list_price", "rapnet_discount", 
     "price_per_carat", "polish", "symmetry", "fluorescen", "certificate_id", "end_price"]
  end
    
    
    
    
end