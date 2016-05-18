require "date"
class OrganizeIndexJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
	  	@latest_date = Table.maximum(:date)
	    @oldest_date = Table.minimum(:date)
	    
	    @latest_date_index = Index.maximum(:date)
	    @oldest_date_index = Index.minimum(:date)
	    
	    if @latest_date_index.present?
	       @last_updated_date_index = @latest_date_index + 1
	     else
	       @last_updated_date_index = @oldest_date
	    end
	    
      @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
      @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
      @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
      
      
      if @latest_date <= Date.new(2015, 12, 31)
        @ref_date = Date.new(2015, 1, 1)
      elsif @latest_date >= Date.new(2016, 1, 1) and @latest_date <= Date.new(2016, 12, 31)
        @ref_date = Date.new(2016, 1, 1)
      elsif @latest_date >= Date.new(2017, 1, 1) and @latest_date <= Date.new(2017, 12, 31)
        @ref_date = Date.new(2017, 1, 1)
      elsif @latest_date >= Date.new(2018, 1, 1) and @latest_date <= Date.new(2018, 12, 31)
        @ref_date = Date.new(2018, 1, 1)
      end
        

      if Index.exists?(date: @ref_date)
      else
        @table_ref = Table.where(:date => @ref_date)
        @table_ref_all_color = @table_ref.select('date, AVG(price) AS avg_price').group(:date)
        # ref_date_data = @table_ref_all_color.where(date: @ref_date)
        ref_date_data = @table_ref_all_color.find_by date: @ref_date
        @ref_price = ref_date_data.avg_price.round
        @ref_index = @ref_price * 100 / @ref_price
        Index.create(date: @ref_date, index1: @ref_index, price1: @ref_price)
      end
      
	    
	    if @latest_date == @latest_date_index
	    elsif @latest_date == @oldest_date
	      if Index.exists?(date: @latest_date)
	      else
	        @table_group_all = Table.where(:date=> @latest_date)
            
          @table_group_all_color = @table_group_all.select('date, AVG(price) AS avg_price').group(:date)
          @table_group_all_color_date = @table_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          #-----Create data table create for Index model-------------
              d = 0
              while d < @table_group_all_color_date.length
                @date = @table_group_all_color_date[d]
                @selected_table_data = @table_group_all_color.find_by date: @date
                
                
                if @date <= Date.new(2015, 12, 31)
                  @ref_date = Date.new(2015, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2016, 1, 1) and @latest_date <= Date.new(2016, 12, 31)
                  @ref_date = Date.new(2016, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2017, 1, 1) and @latest_date <= Date.new(2017, 12, 31)
                  @ref_date = Date.new(2017, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2018, 1, 1) and @latest_date <= Date.new(2018, 12, 31)
                  @ref_date = Date.new(2018, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                end
                # @selected_index_data = Index.where(date: @date)
                # if @selected_index_data != nil
                #   selected_date_index_price_1 = @selected_index_data.price1
                # else
                #   selected_date_index_price_1 = nil
                # end
                
                # if selected_date_index_price_1 != nil
                # else
                    # @selected_table_data = @table_group_all_color.where(date: date)
                    
                      if Index.exists?(date: @date)
                      else
                         @price1 = @selected_table_data.avg_price.round
                         @index1 = @price1 * 100 / @ref_price
                         Index.create(date: @date, index1: @index1, price1: @price1)
                      end
                # end
                d += 1
              end
              
            #-----End_Create data table create for Index model-------------
	      end
 
	    elsif @latest_date != @oldest_date

          if Index.exists?(date: @latest_date)
          else
          @table_group_all = Table.where(:date=> @last_updated_date_index..@latest_date)
          
          @table_group_all_color = @table_group_all.select('date, AVG(price) AS avg_price').group(:date)
          @table_group_all_color_date = @table_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
          #-----Create data table create for Index model-------------
              d = 0
              while d < @table_group_all_color_date.length
                @date = @table_group_all_color_date[d]
                @selected_table_data = @table_group_all_color.find_by date: @date
                
                if @date <= Date.new(2015, 12, 31)
                  @ref_date = Date.new(2015, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2016, 1, 1) and @latest_date <= Date.new(2016, 12, 31)
                  @ref_date = Date.new(2016, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2017, 1, 1) and @latest_date <= Date.new(2017, 12, 31)
                  @ref_date = Date.new(2017, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                elsif @date >= Date.new(2018, 1, 1) and @latest_date <= Date.new(2018, 12, 31)
                  @ref_date = Date.new(2018, 1, 1)
                  ref_price = Index.where(date: @ref_date)
                  ref_data = ref_price.find_by date: @ref_date
                  @ref_price = ref_data.price1
                end
                # @selected_index_data = Index.where(date: @date)
                # if @selected_index_data != nil
                #   selected_date_index_price_1 = @selected_index_data.price1
                # else
                #   selected_date_index_price_1 = nil
                # end
                
                # if selected_date_index_price_1 != nil
                # else
                    # @selected_table_data = @table_group_all_color.where(date: date)
                    
                      if Index.exists?(date: @date)
                      else
                         @price1 = @selected_table_data.avg_price.round
                         @index1 = @price1 * 100 / @ref_price
                         Index.create(date: @date, index1: @index1, price1: @price1)
                      end
                # end
                d += 1
              end
            #-----End_Create data table create for Index model-------------
          end
	    end
	    
	    

  end
end
