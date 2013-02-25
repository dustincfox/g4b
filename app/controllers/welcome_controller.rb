class WelcomeController < ApplicationController
  def index
  	@email_subscription = EmailSubscription.new
  	@subscription_counter = EmailSubscription.all.count
  	
  	@chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Personal Price Index',
               :data=> [
                  ['Food',   45.0],
                  ['Apparel',       26.8],
                  {
                     :name=> 'Restaurants',    
                     :y=> 12.8,
                     :sliced=> true,
                     :selected=> true
                  },
                  ['Transportation (w/o car)',    8.5],
                  ['Transportation (w/ car)',     6.2],
                  ['Fuel',   0.7]
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Your Personal Price Index"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"white",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
		end


  end
end
