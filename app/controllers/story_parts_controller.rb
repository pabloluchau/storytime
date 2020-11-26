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
    the_story_part.body = params.fetch("query_body")
    the_story_part.story_id = params.fetch("query_story_id")
    the_story_part.user_id = params.fetch("query_user_id")
    the_story_part.close_votes_count = params.fetch("query_close_votes_count")

    if the_story_part.valid?
      the_story_part.save
      redirect_to("/story_parts", { :notice => "Story part created successfully." })
    else
      redirect_to("/story_parts", { :notice => "Story part failed to create successfully." })
    end
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
