class StoryPartsController < ApplicationController
  def index
    matching_story_parts = StoryPart.all

    @list_of_story_parts = matching_story_parts.order({ :created_at => :desc })

    render({ :template => "story_parts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_story_parts = StoryPart.where({ :id => the_id })

    @the_story_part = matching_story_parts.at(0)

    render({ :template => "story_parts/show.html.erb" })
  end

  def create
    the_story_part = StoryPart.new
    
    the_story_part.body = params.fetch("query_body").strip
    the_story_part.close_votes_count = 0
    the_story_part.story_id = params.fetch("query_story_id")
    the_story_part.user_id = params.fetch("query_user_id")


    voted_parts = the_story_part.story.story_parts.order({ :close_votes_count => :desc})
    closed_parts = Array.new
    
    voted_parts.each do |vote|
      if vote.close_votes_count.present?
        if vote.close_votes_count > 9
          closed_parts.push("#{vote.id}")
        end
      end
    end

    # if closed_parts == nil
    #   the_story_part.save
    #   redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story part created successfully." })
    # else
    #   p closed_parts
    #   redirect_to("/stories/#{the_story_part.story_id}", { :alert => "Story is closed for new parts" })
    # end
    
    story_split = the_story_part.body.split("")

    if story_split.index(".") == story_split.count() - 1 
      the_story_part.save
      redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story posted!" })
    elsif story_split.index("?") == story_split.count() - 1 
      the_story_part.save
      redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story posted!" })
    elsif story_split.index("!") == story_split.count() - 1 
      the_story_part.save
      redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story posted!" })
    else
      redirect_to("/stories/#{the_story_part.story_id}", { :alert => "The story part can only contain one sentence and must end in a period, question mark, or exclamation point." })
    end

    # if the_story_part.valid?
    #   the_story_part.save
    #   redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story part created successfully." })
    # else
    #   redirect_to("/stories/#{the_story_part.story_id}", { :notice => "Story part failed to create successfully." })
    # end
  end

  def update
    the_id = params.fetch("path_id")
    the_story_part = StoryPart.where({ :id => the_id }).at(0)

    the_story_part.body = params.fetch("query_body")
    the_story_part.story_id = params.fetch("query_story_id")
    the_story_part.user_id = params.fetch("query_user_id")
    the_story_part.close_votes_count = params.fetch("query_close_votes_count")

    if the_story_part.valid?
      the_story_part.save
      redirect_to("/story_parts/#{the_story_part.id}", { :notice => "Story part updated successfully."} )
    else
      redirect_to("/story_parts/#{the_story_part.id}", { :alert => "Story part failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_story_part = StoryPart.where({ :id => the_id }).at(0)

    the_story_part.destroy

    redirect_to("/story_parts", { :notice => "Story part deleted successfully."} )
  end
end
