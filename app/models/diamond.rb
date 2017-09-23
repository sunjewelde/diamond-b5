class Diamond <ActiveRecord::Base

    require "date"
    

    # @weight_max = self.maximum(:weight)
    # @weight_min = self.minimum(:weight)


    
   #7days agoの日付が存在しない場合の対処

    
    scope :weight, ->(weight) {where(weight2: weight)}

    scope :color, ->(color) {where(color: color) if color.present? }
    scope :clar, ->(clar) {where(clar: clar) if clar.present? }
    scope :date, ->(date) {where(date: date) if date.present? }
    scope :cut_grade, ->(cut_grade) {where(cut_grade: cut_grade) if cut_grade.present? }
    scope :polish, ->(polish) {where(polish: polish) if polish.present?}
    scope :symmetry, ->(symmetry) {where(symmetry: symmetry) if symmetry.present? }
    scope :fluorescen, ->(fluorescen) {where(fluorescen: fluorescen) if fluorescen.present? }
    scope :certificate_id, ->(certificate_id) {where(certificate_id: certificate_id) if color.present? }
    scope :end_price, ->(end_price) {where(end_price: end_price) if end_price.present? }
    
    scope :shape, ->(shape) {where(shape: shape) if shape.present? }

    # scope :weight02, -> {where(:weight2=> @weight_min...0.3 ) }
    scope :weight02, -> {where(:weight2=> 0.01...0.3 ) }
    scope :weight03, -> {where(:weight2=> 0.3...0.4 ) }
    scope :weight04, -> {where(:weight2=> 0.4...0.5 ) }
    scope :weight05, -> {where(:weight2=> 0.5...0.6 ) }
    scope :weight06, -> {where(:weight2=> 0.6...0.7 ) }
    scope :weight07, -> {where(:weight2=> 0.7...0.8 ) }
    scope :weight08, -> {where(:weight2=> 0.8...0.9 ) }
    scope :weight09, -> {where(:weight2=> 0.9...1.0 ) }
    scope :weight10, -> {where(:weight2=> 1.0...1.2 ) }
    scope :weight12, -> {where(:weight2=> 1.2...1.5 ) }
    scope :weight15, -> {where(:weight2=> 1.5...1.8 ) }
    scope :weight18, -> {where(:weight2=> 1.8...2.0 ) }
    scope :weight20, -> {where(:weight2=> 2.0...3.0 ) }
    scope :weight30, -> {where(:weight2=> 3.0...4.0 ) }
    scope :weight40, -> {where(:weight2=> 4.0..30.0) }
    
    # Article.where("articles.title = 'Rails 3' OR articles.title = 'Rails 4'")
    scope :cut_grade_exc, -> {where("cut_grade = 'Excellent' OR cut_grade = 'EXC'" )}
    scope :cut_grade_vg, -> {where("cut_grade = 'Very Good' OR cut_grade = 'VGD'" )}
    scope :cut_grade_g, -> {where("cut_grade = 'Good' OR cut_grade = 'VGD'" )}
    
    scope :fluorescen_none, -> {where("fluorescen = 'NONE' OR fluorescen = 'None'" )}
    scope :fluorescen_faint, -> {where("fluorescen = 'Faint' OR fluorescen = 'f' OR fluorescen = 'FT'" )}
    scope :fluorescen_med, -> {where("fluorescen = 'Medium' OR fluorescen = 'mb' OR fluorescen = 'Medium Blue' OR fluorescen = 'md blue' OR fluorescen = 'M.BLUE'" )}
    scope :fluorescen_strong, -> {where("fluorescen = 'Strong' OR fluorescen = 'st' OR fluorescen = 'sb' OR fluorescen = 'str blue' OR fluorescen = 'S.BLUE'" )}
    scope :fluorescen_vs, -> {where("fluorescen = 'VST' OR fluorescen = 'Very Strong' OR fluorescen = 'V.S.BLUE'" )}
    

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
    ["date", "weight2", "color", "clar", "cut_grade", "rapnet_list_price", "rapnet_discount", 
     "price_per_carat", "polish", "symmetry", "fluorescen", "certificate_id", "end_price"]
  end
    
    
    
    
end