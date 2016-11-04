require "date"
class OrganizeListsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
      # diamond_date = Diamond.pluck(:date).uniq
      diamond_date = Table.find_each.map(&:date).uniq
      # diamond_date = Diamond.find_each(batch_size: 10000).map(&:date).uniq
      table_date = List.pluck(:date).uniq
      # uniq_date_pre = diamond_date - table_date
      # uniq_date = uniq_date_pre.compact.sort {|a, b| b <=> a }
      
      uniq_date = (diamond_date - table_date).compact.sort {|a, b| b <=> a }

	    
      @weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
      @color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
      @clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2"]
    
      d = 0
      while d < uniq_date.length
      date = uniq_date[d]
          if uniq_date != []
    	     # else
                
                # @weight03_diamond_group_all = Table.where(:weight2=> 0.3).where(:date=> date)
                # @weight04_diamond_group_all = Table.where(:weight2=> 0.4).where(:date=> date)
                # @weight05_diamond_group_all = Table.where(:weight2=> 0.5).where(:date=> date)
                # @weight06_diamond_group_all = Table.where(:weight2=> 0.6).where(:date=> date)
                # @weight07_diamond_group_all = Table.where(:weight2=> 0.7).where(:date=> date)
                # @weight08_diamond_group_all = Table.where(:weight2=> 0.8).where(:date=> date)
                # @weight09_diamond_group_all = Table.where(:weight2=> 0.9).where(:date=> date)
                # @weight10_diamond_group_all = Table.where(:weight2=> 1.0).where(:date=> date)
                # @weight12_diamond_group_all = Table.where(:weight2=> 1.2).where(:date=> date)
                # @weight15_diamond_group_all = Table.where(:weight2=> 1.5).where(:date=> date)
                # @weight18_diamond_group_all = Table.where(:weight2=> 1.8).where(:date=> date)
                # @weight20_diamond_group_all = Table.where(:weight2=> 2.0).where(:date=> date)
                # @weight30_diamond_group_all = Table.where(:weight2=> 3.0).where(:date=> date)
                # @weight40_diamond_group_all = Table.where(:weight2=> 4.0).where(:date=> date)
                
                @weight03_group_all_color = Table.where(:weight2=> 0.3).where(:date=> date)
                @weight04_group_all_color = Table.where(:weight2=> 0.4).where(:date=> date)
                @weight05_group_all_color = Table.where(:weight2=> 0.5).where(:date=> date)
                @weight06_group_all_color = Table.where(:weight2=> 0.6).where(:date=> date)
                @weight07_group_all_color = Table.where(:weight2=> 0.7).where(:date=> date)
                @weight08_group_all_color = Table.where(:weight2=> 0.8).where(:date=> date)
                @weight09_group_all_color = Table.where(:weight2=> 0.9).where(:date=> date)
                @weight10_group_all_color = Table.where(:weight2=> 1.0).where(:date=> date)
                @weight12_group_all_color = Table.where(:weight2=> 1.2).where(:date=> date)
                @weight15_group_all_color = Table.where(:weight2=> 1.5).where(:date=> date)
                @weight18_group_all_color = Table.where(:weight2=> 1.8).where(:date=> date)
                @weight20_group_all_color = Table.where(:weight2=> 2.0).where(:date=> date)
                @weight30_group_all_color = Table.where(:weight2=> 3.0).where(:date=> date)
                @weight40_group_all_color = Table.where(:weight2=> 4.0).where(:date=> date)
                
              # @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              # @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, price').group(:date, :color, :clar)
              # @weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
              
              #Data table create for List model
                #weight03
                # d = 0
                # while d < @weight03_group_all_color_date.length
                #   date = @weight03_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.3, color: "D") and List.exists?(date: date, weight2: 0.3, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight03_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.3,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight04
                # d = 0
                # while d < @weight04_group_all_color_date.length
                #   date = @weight04_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.4, color: "D") and List.exists?(date: date, weight2: 0.4, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight04_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.4,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
                #weight05
                # d = 0
                # while d < @weight05_group_all_color_date.length
                #   date = @weight05_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.5, color: "D") and List.exists?(date: date, weight2: 0.5, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight05_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
                #weight06
                # d = 0
                # while d < @weight06_group_all_color_date.length
                #   date = @weight06_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.6, color: "D") and List.exists?(date: date, weight2: 0.6, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight06_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.6,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
                #weight07
                # d = 0
                # while d < @weight07_group_all_color_date.length
                #   date = @weight07_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.7, color: "D") and List.exists?(date: date, weight2: 0.7, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight07_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.7,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
                #weight08
                # d = 0
                # while d < @weight08_group_all_color_date.length
                #   date = @weight08_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.8, color: "D") and List.exists?(date: date, weight2: 0.8, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight08_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight09
                # d = 0
                # while d < @weight09_group_all_color_date.length
                #   date = @weight09_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 0.9, color: "D") and List.exists?(date: date, weight2: 0.9, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight09_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 0.9,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight10
                # d = 0
                # while d < @weight10_group_all_color_date.length
                #   date = @weight10_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 1.0, color: "D") and List.exists?(date: date, weight2: 1.0, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight10_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 1.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
                #weight12
                # d = 0
                # while d < @weight12_group_all_color_date.length
                #   date = @weight12_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 1.2, color: "D") and List.exists?(date: date, weight2: 1.2, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight12_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 1.2,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight15
                # d = 0
                # while d < @weight15_group_all_color_date.length
                #   date = @weight15_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 1.5, color: "D") and List.exists?(date: date, weight2: 1.5, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight15_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 1.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight18
                # d = 0
                # while d < @weight18_group_all_color_date.length
                #   date = @weight18_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 1.8, color: "D") and List.exists?(date: date, weight2: 1.8, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight18_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 1.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight20
                # d = 0
                # while d < @weight20_group_all_color_date.length
                #   date = @weight20_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 2.0, color: "D") and List.exists?(date: date, weight2: 2.0, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight20_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 2.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight30
                # d = 0
                # while d < @weight30_group_all_color_date.length
                #   date = @weight30_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 3.0, color: "D") and List.exists?(date: date, weight2: 3.0, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight30_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 3.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
        
        
                #weight40
                # d = 0
                # while d < @weight40_group_all_color_date.length
                #   date = @weight40_group_all_color_date[d]
                  if List.exists?(date: date, weight2: 4.0, color: "D") and List.exists?(date: date, weight2: 4.0, color: "M")
                  else
                      i = 0
                      while i < @color.length
                          selected_color = @color[i]
                          @selected_color_data = @weight40_group_all_color.where(color: selected_color)
                          # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
                          @selected_color_IF = @selected_color_data.find_by clar: "IF"
                          @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
                          @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
                          @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
                          @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
                          @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
                          @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
                        # binding.pry 
                          @IF_price = @selected_color_IF.price if @selected_color_IF.present?
                          @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
                          @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
                          @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
                          @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
                          @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
                          @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
        
                          if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
                            List.create(date: date, color: selected_color, weight2: 4.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
                          end
                          i += 1
                      end
                  end
                #   d += 1
                # end
                #-----End_Data table create for List model---------
          end
        d += 1
      end
 
	   # elsif @latest_date != @oldest_date
    # 	    #date, clar, colorでグループ
    #       # if Table.exists?(date: @latest_date, weight: 0.3, color: "D", clar: "IF") and Table.exists?(date: @oldest_date, weight: 4.0, color: "M" )
    #       if List.exists?(date: @latest_date, weight2: 0.3, color: "D")
    #       else
    #       @weight03_diamond_group_all = Diamond.weight03.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight04_diamond_group_all = Diamond.weight04.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight05_diamond_group_all = Diamond.weight05.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight06_diamond_group_all = Diamond.weight06.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight07_diamond_group_all = Diamond.weight07.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight08_diamond_group_all = Diamond.weight08.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight09_diamond_group_all = Diamond.weight09.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight10_diamond_group_all = Diamond.weight10.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight12_diamond_group_all = Diamond.weight12.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight15_diamond_group_all = Diamond.weight15.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight18_diamond_group_all = Diamond.weight18.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight20_diamond_group_all = Diamond.weight20.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight30_diamond_group_all = Diamond.weight30.where(:date=> @last_updated_date_list..@latest_date)
    #       @weight40_diamond_group_all = Diamond.weight40.where(:date=> @last_updated_date_list..@latest_date)
          
    #       @weight03_group_all_color = @weight03_diamond_group_all.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight03_group_all_color_date = @weight03_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight04_group_all_color = @weight04_diamond_group_all.select('date, color, clar, AVG(end_price * 0.4 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight04_group_all_color_date = @weight04_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight05_group_all_color = @weight05_diamond_group_all.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight05_group_all_color_date = @weight05_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight06_group_all_color = @weight06_diamond_group_all.select('date, color, clar, AVG(end_price * 0.6 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight06_group_all_color_date = @weight06_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight07_group_all_color = @weight07_diamond_group_all.select('date, color, clar, AVG(end_price * 0.7 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight07_group_all_color_date = @weight07_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight08_group_all_color = @weight08_diamond_group_all.select('date, color, clar, AVG(end_price * 0.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight08_group_all_color_date = @weight08_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight09_group_all_color = @weight09_diamond_group_all.select('date, color, clar, AVG(end_price * 0.9 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight09_group_all_color_date = @weight09_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight10_group_all_color = @weight10_diamond_group_all.select('date, color, clar, AVG(end_price * 1.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight10_group_all_color_date = @weight10_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight12_group_all_color = @weight12_diamond_group_all.select('date, color, clar, AVG(end_price * 1.2 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight12_group_all_color_date = @weight12_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight15_group_all_color = @weight15_diamond_group_all.select('date, color, clar, AVG(end_price * 1.5 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight15_group_all_color_date = @weight15_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight18_group_all_color = @weight18_diamond_group_all.select('date, color, clar, AVG(end_price * 1.8 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight18_group_all_color_date = @weight18_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight20_group_all_color = @weight20_diamond_group_all.select('date, color, clar, AVG(end_price * 2.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight20_group_all_color_date = @weight20_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight30_group_all_color = @weight30_diamond_group_all.select('date, color, clar, AVG(end_price * 3.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight30_group_all_color_date = @weight30_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #       @weight40_group_all_color = @weight40_diamond_group_all.select('date, color, clar, AVG(end_price * 4.0 / weight) AS avg_price').group(:date, :color, :clar)
    #       @weight40_group_all_color_date = @weight40_diamond_group_all.pluck(:date).uniq.sort {|a, b| b <=> a }
          
    #         #Data table create for List model
    #         #weight03
    #         d = 0
    #         while d < @weight03_group_all_color_date.length
    #           date = @weight03_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.3, color: "D") and List.exists?(date: date, weight2: 0.3, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight03_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.3,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight04
    #         d = 0
    #         while d < @weight04_group_all_color_date.length
    #           date = @weight04_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.4, color: "D") and List.exists?(date: date, weight2: 0.4, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight04_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.4,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    #         #weight05
    #         d = 0
    #         while d < @weight05_group_all_color_date.length
    #           date = @weight05_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.5, color: "D") and List.exists?(date: date, weight2: 0.5, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight05_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    #         #weight06
    #         d = 0
    #         while d < @weight06_group_all_color_date.length
    #           date = @weight06_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.6, color: "D") and List.exists?(date: date, weight2: 0.6, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight06_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.6,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    #         #weight07
    #         d = 0
    #         while d < @weight07_group_all_color_date.length
    #           date = @weight07_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.7, color: "D") and List.exists?(date: date, weight2: 0.7, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight07_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.7,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    #         #weight08
    #         d = 0
    #         while d < @weight08_group_all_color_date.length
    #           date = @weight08_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.8, color: "D") and List.exists?(date: date, weight2: 0.8, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight08_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight09
    #         d = 0
    #         while d < @weight09_group_all_color_date.length
    #           date = @weight09_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 0.9, color: "D") and List.exists?(date: date, weight2: 0.9, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight09_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 0.9,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight10
    #         d = 0
    #         while d < @weight10_group_all_color_date.length
    #           date = @weight10_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 1.0, color: "D") and List.exists?(date: date, weight2: 1.0, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight10_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 1.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    #         #weight12
    #         d = 0
    #         while d < @weight12_group_all_color_date.length
    #           date = @weight12_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 1.2, color: "D") and List.exists?(date: date, weight2: 1.2, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight12_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 1.2,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight15
    #         d = 0
    #         while d < @weight15_group_all_color_date.length
    #           date = @weight15_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 1.5, color: "D") and List.exists?(date: date, weight2: 1.5, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight15_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 1.5,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight18
    #         d = 0
    #         while d < @weight18_group_all_color_date.length
    #           date = @weight18_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 1.8, color: "D") and List.exists?(date: date, weight2: 1.8, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight18_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 1.8,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight20
    #         d = 0
    #         while d < @weight20_group_all_color_date.length
    #           date = @weight20_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 2.0, color: "D") and List.exists?(date: date, weight2: 2.0, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight20_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 2.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight30
    #         d = 0
    #         while d < @weight30_group_all_color_date.length
    #           date = @weight30_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 3.0, color: "D") and List.exists?(date: date, weight2: 3.0, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight30_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 3.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    
    
    #         #weight40
    #         d = 0
    #         while d < @weight40_group_all_color_date.length
    #           date = @weight40_group_all_color_date[d]
    #           if List.exists?(date: date, weight2: 4.0, color: "D") and List.exists?(date: date, weight2: 4.0, color: "M")
    #           else
    #               i = 0
    #               while i < @color.length
    #                   selected_color = @color[i]
    #                   @selected_color_data = @weight40_group_all_color.where(date: date).where(color: selected_color)
    #                   # @selected_color_data_05 = @weight05_group_all_color.select('date, color, clar, AVG(end_price * 0.5 / weight) AS avg_price').where(date: date).where(color: selected_color)
    #                   @selected_color_IF = @selected_color_data.find_by clar: "IF"
    #                   @selected_color_VVS1 = @selected_color_data.find_by clar: "VVS1"
    #                   @selected_color_VVS2 = @selected_color_data.find_by clar: "VVS2"
    #                   @selected_color_VS1 = @selected_color_data.find_by clar: "VS1"
    #                   @selected_color_VS2 = @selected_color_data.find_by clar: "VS2"
    #                   @selected_color_SI1 = @selected_color_data.find_by clar: "SI1"
    #                   @selected_color_SI2 = @selected_color_data.find_by clar: "SI2"
    #                 # binding.pry 
    #                   @IF_price = @selected_color_IF.price if @selected_color_IF.present?
    #                   @VVS1_price = @selected_color_VVS1.price if @selected_color_VVS1.present?
    #                   @VVS2_price = @selected_color_VVS2.price if @selected_color_VVS2.present?
    #                   @VS1_price = @selected_color_VS1.price if @selected_color_VS1.present?
    #                   @VS2_price = @selected_color_VS2.price if @selected_color_VS2.present?
    #                   @SI1_price = @selected_color_SI1.price if @selected_color_SI1.present?
    #                   @SI2_price = @selected_color_SI2.price if @selected_color_SI2.present?
    
    #                   if @IF_price.present? and @VVS1_price.present? and @VVS2_price.present? and @VS1_price.present? and @VS2_price.present? and @SI1_price.present? and @SI2_price.present?
    #                     List.create(date: date, color: selected_color, weight2: 4.0,  if1: @IF_price, vvs1: @VVS1_price, vvs2: @VVS2_price, vs1: @VS1_price, vs2: @VS2_price, si1: @SI1_price, si2: @SI2_price)
    #                   end
    #                   i += 1
    #               end
    #           end
    #           d += 1
    #         end
    #         #-----End_Data table create for List model---------
    #       end
	   # end
    MyMailer.upload_confirmation.deliver
  end
end
