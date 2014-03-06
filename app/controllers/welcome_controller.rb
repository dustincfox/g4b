class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
  		@my_posts = current_user.committed_tos
  		tag_ids = []
  		@my_posts.each do |p| 
        ids = p.tags.pluck(:id)
        ids.each do |id|
          unless tag_ids.include?(id)
            tag_ids.push(id)
          end
        end
      end
  		if tag_ids.present?
  			@my_tags = Tag.find_all_by_id(tag_ids)
  		else 
  			@my_tags = []
  		end
  	end
    @near_by_actions = Post.all
		@trending_actions = Post.all
		@trending_tags = Tag.last(8)
    @tags_near_you = Tag.last(8)
  end
  def about
  end
  def how
  end
  def survey
  end
  def submit_survey

    care = 0
    fairness = 0
    loyalty = 0
    authority = 0
    purity = 0

    answers = []
    params.each do |key, value|
      unless key == "utf8" || key == "six" || key == "twentytwo" || key == "action" || key == "authenticity_token" || key == "controller" || key == "commit" 
        answers.push(value)
      end
    end

    care = answers.each_slice(5).map(&:first).map{ |n| n.to_i }
    care = care.inject { |sum, n| sum + n.to_i }

    fairness = answers.drop(1).each_slice(5).map(&:first).map{ |n| n.to_i }
    fairness = fairness.inject { |sum, n| sum + n.to_i }

    loyalty = answers.drop(2).each_slice(5).map(&:first).map{ |n| n.to_i }
    loyalty = loyalty.inject { |sum, n| sum + n.to_i }

    authority = answers.drop(3).each_slice(5).map(&:first).map{ |n| n.to_i }
    authority = authority.inject { |sum, n| sum + n.to_i }

    purity = answers.drop(4).each_slice(5).map(&:first).map{ |n| n.to_i }
    purity = purity.inject { |sum, n| sum + n.to_i }

    user = current_user
    user.care = care
    user.fairness = fairness
    user.loyalty = loyalty
    user.authority = authority
    user.purity = purity

    if user.save
      respond_to do |format|
        format.html { redirect_to root_path, notice:"Welcome! Here are Actions that match your values. Join, Take, and comment on Actions and Causes to improve your matching and unlock more permissions on the site." }
        format.json { render json: @post }
      end    
    else
      respond_to do |format|
        format.html { redirect_to :back, notice:"There was an error. Please try again." }
        format.json { render json: @post }
      end          
    end
  end
end
