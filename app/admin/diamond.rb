ActiveAdmin.register Diamond do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

    index do
        column :date
        column "Calut", :weight2
        column "Color", :color
        column "Crality", :clar
        
        column "cut_grade", :cut_grade
        column "rapnet_list_price", :rapnet_list_price
        column "rapnet_discount", :rapnet_discount
        column "price_per_carat", :price_per_carat
        column "polish", :polish
        column "symmetry", :symmetry
        column "fluorescen", :fluorescen
        
        column "MeasLength", :length
        column "MeasWidth", :width
        column "MeasDepth", :depth
        column "Shape", :shape
        column "Depth%", :depth_percent
        column "Table%", :table_percent
        
        column "Girdle_Thin%", :girdle_thin
        column "Girdle_Thick%", :girdle_thick
        
        column "ID", :certificate_id
        
        column "Price", :end_price
        # column "Price", :end_price, :sortable => :end_price do |diamond|
        #     div :class => "diamond" do
        #         number_to_currency diamond.price
        #     end
        # end
        # default_actions
    end

end

