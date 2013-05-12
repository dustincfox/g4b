class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id])
    @posts = Post.tagged_with(params[:id])
    @start_date = @posts.first.created_at.to_date
    @tag_engagement = LazyHighCharts::HighChart.new('area') do |f|
      f.options[:title][:text] = "Tag Engagement"
      f.options[:subtitel][:text] = "Number of Checkins on Top 10 Actions"
      f.options[:chart][:defaultSeriesType] = "line"
      f.options[:plotOptions] = {:area => { stacking: "normal", :pointInterval => "#{1.day}", :pointStart => @start_date }}
      @posts.each do |p|
        f.series(:name=>"#{p.title}", :data => p.checkins_per_day )
      end
    end
  end
end

# xAxis: {
#                 categories: ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
#                 tickmarkPlacement: 'on',
#                 title: {
#                     enabled: false
#                 }
#             },
#             yAxis: {
#                 title: {
#                     text: 'Billions'
#                 },
#                 labels: {
#                     formatter: function() {
#                         return this.value / 1000;
#                     }
#                 }
#             },