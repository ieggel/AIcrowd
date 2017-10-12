class LeaderboardsController < ApplicationController
  before_action :authenticate_participant!, except: [:index, :video_modal]
  before_action :set_leaderboard, only: [:show]
  before_action :set_challenge
  respond_to :js, :html

  def index
    @current_round = current_round
    Rails.logger.debug("current_round: #{@current_round.id}")
    if @challenge.completed?
      if params[:post_challenge] == 'on'
        @post_challenge = 'on'
      else
        @post_challenge = 'off'
      end
    end
    if @post_challenge == 'on'
      @leaderboards = @challenge.ongoing_leaderboards.page(params[:page]).per(25)
    else
      @leaderboards = @challenge.leaderboards.page(params[:page]).per(25)
    end

    if current_participant && (current_participant.admin? || @challenge.organizer_id == current_participant.organizer_id)
      @participant_submissions = ParticipantSubmission.where(challenge_id: @challenge.id)
    end
    Rails.logger.debug("Leaderboard page: #{@leaderboards.current_page}")
  end


  def video_modal
    @leaderboard = Leaderboard.where(submission_id: params[:submission_id]).first
    respond_to do |format|
      format.html { redirect_to challenge_leaderboards_path(@challenge) }
      format.js { render 'leaderboards/ajax/video_modal' }
    end
  end

  def submission_detail
    @leaderboard = @challenge.leaderboards
    @submissions = Submission.where(participant_id: params[:participant_id],challenge_id: params[:challenge_id]).order(created_at: :desc)
    render js: concept(Leaderboard::Cell,@leaderboard, challenge: @challenge, submissions: @submissions).(:insert_submissions)
  end

  private
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

  def current_round
    if params[:challenge_round_id].present?
      Stage.find(params[:challenge_round_id].to_i)
    else
      @challenge.stages.where(active: true).first
    end
  end

end
