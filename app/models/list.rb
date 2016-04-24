class List <ActiveRecord::Base
    
    scope :select_color_clar, -> {select('color, if1, vvs1, vvs2, vs1, vs2, si1, si2')}
    
    
end