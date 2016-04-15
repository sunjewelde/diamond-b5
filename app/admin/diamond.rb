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
        column "ID", :certificate_id
        column "Calut", :weight
        column "Color", :color
        column "Crality", :clar
        column "Price", :end_price, :sortable => :end_price do |diamond|
            div :class => "diamond" do
                number_to_currency diamond.price
            end
        end
        default_actions
    end

end
