class StoriesController < ApplicationController
  def index
    matching_stories = Story.all

    @list_of_stories = matching_stories.order({ :created_at => :desc })

    render({ :template => "stories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stories = Story.where({ :id => the_id })

    @the_story = matching_stories.at(0)

    @the_story_parts = @the_story.story_parts.order({ :created_at => :asc})

    render({ :template => "stories/show.html.erb" })
  end

  def create
    the_story = Story.new
    the_story.body = params.fetch("query_body").strip
    the_story.user_id = @current_user.id
    the_story.filter = params.fetch("query_filter")
    the_story.likes_count = 0

    story_split = the_story.body.split("")

    if story_split.index(".") == story_split.count() - 1 
      the_story.save
      redirect_to("/stories", { :notice => "Story posted!" })
    elsif story_split.index("?") == story_split.count() - 1 
      the_story.save
      redirect_to("/stories", { :notice => "Story posted!" })
    elsif story_split.index("!") == story_split.count() - 1 
      the_story.save
      redirect_to("/stories", { :notice => "Story posted!" })
    else
      redirect_to("/stories", { :alert => "The story start can only contain one sentence and must end in a period, question mark, or exclamation point." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.body = params.fetch("query_body")
    the_story.user_id = params.fetch("query_user_id")
    the_story.filter = params.fetch("query_filter")
    the_story.likes_count = params.fetch("query_likes_count")

    if the_story.valid?
      the_story.save
      redirect_to("/stories/#{the_story.id}", { :notice => "Story updated successfully."} )
    else
      redirect_to("/stories/#{the_story.id}", { :alert => "Story failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.destroy

    redirect_to("/stories", { :notice => "Story deleted successfully."} )
  end
end
