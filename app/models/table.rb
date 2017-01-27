class Table < ActiveRecord::Base
    
    # def table_data_casche
    #     @latest_date = Table.maximum(:date)
    #     @oldest_date = Table.minimum(:date)
        
    #     @two_week_ago = @latest_date - 14
    #     @one_months_ago = @latest_date - 30
    #     @three_months_ago = @latest_date - 90
    #     @six_months_ago = @latest_date - 180
    #     @one_year_ago = @latest_date - 364
        
    #         Rails.cache.fetch("diamonds_2w_D", expires_in: 5.hour) do
    #             Table.where(:date=> @two_week_ago..@latest_date).where(:color => "D").group(:date)
    #             # @diamonds_D_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "D").group(:date)
    #             # @diamonds_E_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "E").group(:date)
    #             # @diamonds_F_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "F").group(:date)
    #             # @diamonds_G_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "G").group(:date)
    #             # @diamonds_H_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "H").group(:date)
    #             # @diamonds_I_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "I").group(:date)
    #             # @diamonds_J_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "J").group(:date)
    #             # @diamonds_K_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "K").group(:date)
    #             # @diamonds_L_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "L").group(:date)
    #             # @diamonds_M_2w = Table.where(:date=> @two_week_ago..@latest_date).where(:color => "M").group(:date)
    #         end
            
    #         Rails.cache.fetch("diamonds_1m", expires_in: 5.hour) do
    #             @diamonds_D_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "D").group(:date)
    #             @diamonds_E_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "E").group(:date)
    #             @diamonds_F_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "F").group(:date)
    #             @diamonds_G_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "G").group(:date)
    #             @diamonds_H_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "H").group(:date)
    #             @diamonds_I_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "I").group(:date)
    #             @diamonds_J_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "J").group(:date)
    #             @diamonds_K_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "K").group(:date)
    #             @diamonds_L_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "L").group(:date)
    #             @diamonds_M_1m = Table.where(:date=> @one_months_ago..@latest_date).where(:color => "M").group(:date)
    #         end
            
    #         Rails.cache.fetch("diamonds_3m", expires_in: 5.hour) do
    #             @diamonds_D_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "D").group(:date)
    #             @diamonds_E_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "E").group(:date)
    #             @diamonds_F_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "F").group(:date)
    #             @diamonds_G_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "G").group(:date)
    #             @diamonds_H_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "H").group(:date)
    #             @diamonds_I_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "I").group(:date)
    #             @diamonds_J_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "J").group(:date)
    #             @diamonds_K_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "K").group(:date)
    #             @diamonds_L_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "L").group(:date)
    #             @diamonds_M_3m = Table.where(:date=> @three_months_ago..@latest_date).where(:color => "M").group(:date)
    #         end
            
    #         Rails.cache.fetch("diamonds_6m", expires_in: 5.hour) do
    #             @diamonds_D_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "D").group(:date)
    #             @diamonds_E_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "E").group(:date)
    #             @diamonds_F_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "F").group(:date)
    #             @diamonds_G_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "G").group(:date)
    #             @diamonds_H_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "H").group(:date)
    #             @diamonds_I_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "I").group(:date)
    #             @diamonds_J_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "J").group(:date)
    #             @diamonds_K_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "K").group(:date)
    #             @diamonds_L_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "L").group(:date)
    #             @diamonds_M_6m = Table.where(:date=> @six_months_ago..@latest_date).where(:color => "M").group(:date)
    #         end
            
    #         Rails.cache.fetch("diamonds_1y", expires_in: 5.hour) do
    #             @diamonds_D_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "D").group(:date)
    #             @diamonds_E_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "E").group(:date)
    #             @diamonds_F_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "F").group(:date)
    #             @diamonds_G_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "G").group(:date)
    #             @diamonds_H_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "H").group(:date)
    #             @diamonds_I_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "I").group(:date)
    #             @diamonds_J_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "J").group(:date)
    #             @diamonds_K_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "K").group(:date)
    #             @diamonds_L_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "L").group(:date)
    #             @diamonds_M_1y = Table.where(:date=>  @one_year_ago..@latest_date).where(:color => "M").group(:date)
    #         end
    # end
    

	    
    
    
end
