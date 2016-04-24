class List <ActiveRecord::Base
    
    scope :select_color_clar, -> {select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2')}
    
    scope :weight03, -> {where(:weight=> 0.2999...0.3001 ) }
    scope :weight04, -> {where(:weight=> 0.3999...0.4001 ) }
    scope :weight05, -> {where(:weight=> 0.4999...0.5001 ) }
    scope :weight06, -> {where(:weight=> 0.5999...0.6001 ) }
    scope :weight07, -> {where(:weight=> 0.6999...0.7001 ) }
    scope :weight08, -> {where(:weight=> 0.7999...0.8001 ) }
    scope :weight09, -> {where(:weight=> 0.8999...0.9001 ) }
    scope :weight10, -> {where(:weight=> 0.9999...1.0001 ) }
    scope :weight12, -> {where(:weight=> 1.1999...1.2001) }
    scope :weight15, -> {where(:weight=> 1.4999...1.5001 ) }
    scope :weight18, -> {where(:weight=> 1.7999...1.8001 ) }
    scope :weight20, -> {where(:weight=> 1.9999...2.0001 ) }
    scope :weight30, -> {where(:weight=> 2.999...3.0001 ) }
    scope :weight40, -> {where(:weight=> 3.999...4.0001 ) }
    
end