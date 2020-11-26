class CloseVotesController < ApplicationController
  def index
    matching_close_votes = CloseVote.all

    @list_of_close_votes = matching_close_votes.order({ :created_at => :desc })

    render({ :template => "close_votes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_close_votes = CloseVote.where({ :id => the_id })

    @the_close_vote = matching_close_votes.at(0)

    render({ :template => "close_votes/show.html.erb" })
  end

  def create
    the_close_vote = CloseVote.new
    the_close_vote.story_id = params.fetch("query_story_id")
    the_close_vote.user_id = params.fetch("query_user_id")

    if the_close_vote.valid?
      the_close_vote.save
      redirect_to("/close_votes", { :notice => "Close vote created successfully." })
    else
      redirect_to("/close_votes", { :notice => "Close vote failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_close_vote = CloseVote.where({ :id => the_id }).at(0)

    the_close_vote.story_id = params.fetch("query_story_id")
    the_close_vote.user_id = params.fetch("query_user_id")

    if the_close_vote.valid?
      the_close_vote.save
      redirect_to("/close_votes/#{the_close_vote.id}", { :notice => "Close vote updated successfully."} )
    else
      redirect_to("/close_votes/#{the_close_vote.id}", { :alert => "Close vote failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_close_vote = CloseVote.where({ :id => the_id }).at(0)

    the_close_vote.destroy

    redirect_to("/close_votes", { :notice => "Close vote deleted successfully."} )
  end
end
