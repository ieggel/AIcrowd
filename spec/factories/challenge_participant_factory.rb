FactoryBot.define do
  factory :challenge_participant, class: ChallengeParticipant do
    challenge
    participant
    accepted_dataset_toc true
  end
end