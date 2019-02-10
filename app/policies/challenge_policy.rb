class ChallengePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    ChallengePolicy::Scope.new(participant,Challenge).resolve.include?(@record)
  end

  def edit?
    participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
  end

  def reorder?
    participant && participant.admin?
  end

  def assign_order?
    participant && participant.admin?
  end

  def update?
    edit?
  end

  def new?
    edit?
  end

  def create?
    new?
  end

  def destroy?
    edit?
  end

  def regrade?
    edit?
  end

  def regen_api_key?
    update?
  end

  def remove_image?
    update?
  end

  def clef_task?
    update?
  end

  def current_challenge_rules
    ChallengeRules.where(challenge_id: @record.id).order("version DESC").first
  end

  def current_challenge_rules_version
    current_challenge_rules && current_challenge_rules.version
  end

  def has_accepted_challenge_rules?
    if !participant
      return
    end
    cp = ChallengeParticipant.where(challenge_id: @record.id, participant_id: participant.id).first
    if !cp
      return
    end
    if (cp.challenge_rules_accepted_version != current_challenge_rules_version)
      return
    end
    if !cp.challenge_rules_accepted_date
      return
    end
    return true
  end

  def current_participation_terms
    ParticipationTerms.current_terms
  end

  def current_participation_terms_version
    current_participation_terms && current_participation_terms.version
  end

  def has_accepted_participation_terms?
    if !participant
      return
    end
    if (participant.participation_terms_accepted_version != current_participation_terms_version)
      return
    end
    if !participant.participation_terms_accepted_date
      return
    end
    return true
  end

  def show_leaderboard?
    @record.challenge_rounds.present? &&
      @record.show_leaderboard == true ||
        (participant &&
          (participant.admin? || @record.organizer_id == participant.organizer_id))
  end

  def submissions_allowed?
    return false unless @record.online_submissions
    if participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
      return true
    end
    if @record.running? || (@record.completed? && @record.post_challenge_submissions?)
      if @record.clef_challenge.present?
        if clef_participant_registered?(@record)
          return true #return true if running and clef challenge and registered
        else
          return false #return false if running and clef_challenge and NOT REGISTERED
        end
      else
        return true #return true if running and no clef challenge
      end
    end
    return false # no positive condition met
  end

  def clef_participant_registered?(challenge)
    return false unless participant.present?
    clef_task = challenge.clef_task
    participant_clef_task = ParticipantClefTask.where(
      participant_id: participant,
      clef_task_id: clef_task.id).first
    if participant_clef_task
      return true if participant_clef_task.registered?
    else
      return false
    end
  end


  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def participant_sql(email:)
      %Q[
        challenges.status_cd IN ('running','completed','starting_soon')
        AND challenges.private_challenge IS FALSE
        OR (challenges.private_challenge IS TRUE
            AND EXISTS (SELECT 'X'
                    FROM invitations
                    WHERE invitations.challenge_id = challenges.id
                    AND invitations.email = '#{email}'))
      ]
    end

    def resolve
      if participant && participant.admin?
        scope.all
      else
        if participant && participant.organizer_id
          scope.where("status_cd IN ('running','completed','starting_soon') OR organizer_id = ?", participant.organizer_id)
        elsif participant
          scope.where(participant_sql(email: participant.email))
        else
          scope.where("status_cd IN ('running','completed','starting_soon') AND challenges.private_challenge IS FALSE")
        end
      end
    end
  end

end
