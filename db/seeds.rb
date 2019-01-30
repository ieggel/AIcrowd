if Rails.env == 'development' || Rails.env == 'staging'

  ChallengeCallResponse.destroy_all
  ChallengeCall.destroy_all
  Comment.destroy_all
  Topic.destroy_all
  JobPosting.destroy_all
  Blog.destroy_all
  Submission.destroy_all
  ChallengeParticipant.destroy_all
  Participant.destroy_all
  BaseLeaderboard.destroy_all
  ChallengeRound.destroy_all
  Challenge.destroy_all
  Partner.destroy_all
  Organizer.destroy_all

  # Admin
  Participant.create!(
    id: 2,
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    admin: true,
    name: 'adminuser',
    confirmed_at: Time.now)

  # Users
  participant_ids =
    [1,7,374,1235,1780,1817,3272,4839,4913,5366,5442,5471,5579,5593,5984,6439,6625,6791,6792,6905,7071,7230,7294,7358,7389,7420,7453]

  participant_ids.each do |id|
    Participant.create!(
      id: id,
      email: "p#{id}@example.com",
      password: 'password',
      password_confirmation: 'password',
      name: "p#{id}",
      confirmed_at: Time.now,
      )
  end


  # Organizers
  Organizer.create!([
    {id: 21, organizer: "Poznan University of Technology", address: "Laboratory of Intelligent Decision Support Systems", description: "", approved: true, slug: "poznan-university-of-technology", tagline: "Poznan University of Technology", challenge_proposal: "", api_key: "14b4a11368bb0e22134137aa55bf86af", clef_organizer: false},
    {id: 17, organizer: "SBB CFF FFS", address: "Switzerland", description: "SBB Swiss Federal Railways", approved: true, slug: "sbb-cff-ffs", tagline: "SBB CFF FFS", challenge_proposal: "", api_key: "", clef_organizer: false}
  ])

  Participant.create!(
    id: 112233,
    email: 'test_user@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'test_user',
    confirmed_at: Time.now,
    bio: "I am a test user, all participant page testing will be done on me",
    website: "https://www.testuser.com",
    github: "https://www.github.com/testuser",
    linkedin: "https://www.linkedin.com/testuser",
    twitter: "https://www.twitter.com/testuser",
    slug: "test_user",
    remote_image_file_url: "https://dnczkxd1gcfu5.cloudfront.net/images/challenges/image_file/50/spotify.png",
    affiliation: "Test User Incorporated",
    country_cd: "IN",
    address: "TU Block, Pillar number 420",
    city: "Mumbai",
    first_name: "Test",
    last_name: "User",
    organizer_id: 21)

  member_poznac_ids = [1020, 1050, 1110]

  member_poznac_ids.each do |id|
    Participant.create!(
      id: id,
      organizer_id: 21,
      email: "p#{id}@example.com",
      password: 'password',
      password_confirmation: 'password',
      name: "p#{id}",
      confirmed_at: Time.now)
  end

  member_sbb_ids = [1051, 1054, 1150]

  member_sbb_ids.each do |id|
    Participant.create!(
      id: id,
      organizer_id: 17,
      email: "p#{id}@example.com",
      password: 'password',
      password_confirmation: 'password',
      name: "p#{id}",
      confirmed_at: Time.now)
  end

  # Partners
  Partner.create!([
    {id: 19022, organizer_id: 21 , image_file: "logo-organizer-spotify.svg", name: "Spotify", visible: true},
    {id: 10223, organizer_id: 17 , image_file: "logo-organizer-spotify.svg", name: "Uber", visible: true}
  ])

  # Challenges
  Challenge.create!([
    {id: 37,
      organizer_id: 21,
      challenge: "Train Schedule Optimisation Challenge",
      prize_cash: "$1 Million USD",
      prize_academic: "8",
      prize_misc: "Some other things",
      status_cd: "running",
      tagline: "Optimizing train schedules ",
      primary_sort_order_cd: "ascending",
      secondary_sort_order_cd: "not_used",
      perpetual_challenge: false,
      answer_file_s3_key: nil,
      page_views: 10455,
      participant_count: 195,
      submission_count: 13,
      score_title: "Score",
      score_secondary_title: "Secondary Score",
      slug: "train-schedule-optimisation-challenge",
      submission_license: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.",
      api_required: false,
      media_on_leaderboard: false,
      challenge_client_name: "sbb_train_schedule_optimisation_challenge_2018",
      online_grading: true,
      vote_count: 55,
      toc_acceptance_text: "Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?",
      description_markdown: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.",
      license_markdown: "",
      license: "",
      dataset_description_markdown: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.",
      dataset_description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.", image_file: "sbb_challenge.png",
      featured_sequence: 8,
      dynamic_content_flag: false,
      dynamic_content: nil,
      dynamic_content_tab: nil,
      winner_description_markdown: nil,
      winner_description: nil,
      winners_tab_active: false,
      clef_task_id: nil,
      clef_challenge: false,
      submissions_page: true,
      private_challenge: false,
      show_leaderboard: true,
      grader_identifier: "crowdAI_GRADER_POOL",
      online_submissions: true,
      grader_logs: true,
      require_registration: false,
      grading_history: true,
      post_challenge_submissions: false},
    {id: 30,
      organizer_id: 17,
      challenge: "Visual Doom AI Competition 2018 - Singleplayer Track (1)",
      prize_cash: "$2 Million USD",
      prize_travel: "3",
      prize_academic: "4",
      prize_misc: "Swag",
      status_cd: "completed",
      tagline: "ViZDoom Reinforcement Learning ",
      primary_sort_order_cd: "ascending",
      secondary_sort_order_cd: "ascending",
      perpetual_challenge: false,
      answer_file_s3_key: nil,
      page_views: 7570,
      participant_count: 53,
      submission_count: 204,
      score_title: "Mean Time (mins)",
      score_secondary_title: "Median Time (mins)",
      slug: "visual-doom-ai-competition-2018-singleplayer-track-1",
      submission_license: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.",
      api_required: false,
      media_on_leaderboard: true,
      challenge_client_name: "vizdoom2018_single_player",
      online_grading: true,
      vote_count: 42,
      toc_acceptance_text: "Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?Who reads TOC?",
      description_markdown: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel malesuada leo, in efficitur erat. Nam id purus nulla. Cras ac libero eget diam luctus ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris tempor aliquet malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at quam ac enim elementum placerat luctus euismod dui. Suspendisse ligula lacus, luctus vel placerat vitae, varius ac sem. Quisque venenatis lectus eu nulla commodo molestie. Vestibulum consectetur elit dictum risus consequat, at laoreet risus euismod.", license_markdown: "Example ",
      license: "<p>Example</p>\n", dataset_description_markdown: "Example ", dataset_description: "<p>Example</p>\n",
      image_file: "Doom_cover_square.jpg",
      featured_sequence: 0,
      dynamic_content_flag: false,
      dynamic_content: nil,
      dynamic_content_tab: nil,
      winner_description_markdown: nil,
      winner_description: nil,
      winners_tab_active: false,
      clef_task_id: nil,
      clef_challenge: false,
      submissions_page: true,
      private_challenge: false,
      show_leaderboard: true,
      grader_identifier: "vizdoom2018_single_player",
      online_submissions: false,
      grader_logs: true,
      require_registration: false,
      grading_history: false,
      post_challenge_submissions: false}
  ])

  ChallengeRound.create!([
    {id: 32,
      challenge_id: 30,
      challenge_round: "Public Evaluation",
      active: true,
      submission_limit: 2,
      submission_limit_period_cd: "day",
      start_dttm: "2018-07-13 12:00:00",
      end_dttm: "2018-08-12 23:59:00",
      minimum_score: nil,
      minimum_score_secondary: nil,
      ranking_window: 24,
      ranking_highlight: 3,
      score_precision: 3,
      score_secondary_precision: 3,
      leaderboard_note_markdown: "",
      leaderboard_note: "\n"},
    {id: 52,
      challenge_id: 37,
      challenge_round: "Round 1",
      active: true,
      submission_limit: 5,
      submission_limit_period_cd: "day",
      start_dttm: "2018-08-08 12:00:00",
      end_dttm: "2018-11-09 12:00:00",
      minimum_score: nil,
      minimum_score_secondary: nil,
      ranking_window: 96,
      ranking_highlight: 3,
      score_precision: 3,
      score_secondary_precision: 3,
      leaderboard_note_markdown: "",
      leaderboard_note: "\n"},
    {id: 42,
      challenge_id: 30,
      challenge_round: "Final Evaluation",
      active: false,
      submission_limit: 5,
      submission_limit_period_cd: "day",
      start_dttm: "2018-08-11 12:00:00",
      end_dttm: "2018-12-31 12:00:00",
      minimum_score: nil,
      minimum_score_secondary: nil,
      ranking_window: 96,
      ranking_highlight: 3,
      score_precision: 3,
      score_secondary_precision: 3,
      leaderboard_note_markdown: "",
      leaderboard_note: "\n"}
  ])


### Run additional seeds
if Rails.env == 'development' || Rails.env == 'staging'
  Dir[File.join(Rails.root, 'db', 'seeds/*', '*.rb')].sort.each do |seed|
    Dir.chdir(File.dirname(seed)) do
      load seed
    end
  end
end


# Submissions
Submission.create!([

    # Challenge 37

    {id: 13511, challenge_id: 37, participant_id: 1020, score: 80000.2, created_at: "2018-08-15 15:05:56", updated_at: "2018-08-15 15:06:01", score_secondary: 2.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 80000.2, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 13509, challenge_id: 37, participant_id: 1020, score: nil, created_at: "2018-08-15 14:40:42", updated_at: "2018-08-15 14:40:46", score_secondary: nil, grading_status_cd: "failed", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12926, challenge_id: 37, participant_id: 7420, score: 373.70000005, created_at: "2018-08-10 15:48:37", updated_at: "2018-08-10 15:50:48", score_secondary: 4.0, grading_status_cd: "graded", description_markdown: "Second submission with slight variation", post_challenge: false, challenge_round_id: 52, score_display: 373.7, score_secondary_display: 3.0, baseline: false, baseline_comment: nil},
    {id: 12939, challenge_id: 37, participant_id: 7420, score: 10373.0, created_at: "2018-08-10 18:35:06", updated_at: "2018-08-10 18:36:55", score_secondary: 6.0, grading_status_cd: "graded", description_markdown: "Scoring test", post_challenge: false, challenge_round_id: 52, score_display: 10373.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12949, challenge_id: 37, participant_id: 7420, score: 363.5999981, created_at: "2018-08-10 20:30:48", updated_at: "2018-08-10 20:32:35", score_secondary: 3.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 363.6, score_secondary_display: 6.0, baseline: false, baseline_comment: nil},
    {id: 12988, challenge_id: 37, participant_id: 1235, score: 30581.9166792, created_at: "2018-08-11 08:07:46", updated_at: "2018-08-11 08:08:40", score_secondary: 1.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 30581.917, score_secondary_display: 3.0, baseline: false, baseline_comment: nil},
    {id: 12990, challenge_id: 37, participant_id: 7420, score: nil, created_at: "2018-08-11 08:38:59", updated_at: "2018-08-11 08:39:04", score_secondary: nil, grading_status_cd: "failed", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12994, challenge_id: 37, participant_id: 1235, score: 30581.9166792, created_at: "2018-08-11 09:27:50", updated_at: "2018-08-11 09:28:50", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 30581.917, score_secondary_display: 2.0, baseline: false, baseline_comment: nil},
    {id: 13615, challenge_id: 37, participant_id: 1020, score: 60001.6000001, created_at: "2018-08-16 16:01:34", updated_at: "2018-08-16 16:01:53", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 60001.6, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 12925, challenge_id: 37, participant_id: 7420, score: 344.5, created_at: "2018-08-10 15:34:15", updated_at: "2018-08-10 15:36:03", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: "Trivial not completely working solution to test submission process", post_challenge: false, challenge_round_id: 52, score_display: 344.5, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 12991, challenge_id: 37, participant_id: 3272, score: 765.872345, created_at: "2018-08-12 08:48:59", updated_at: "2018-08-12 08:49:04", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 765.872345, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12995, challenge_id: 37, participant_id: 3272, score: 777.9166792, created_at: "2018-08-13 09:27:50", updated_at: "2018-08-13 09:28:50", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: 777.9166792, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 13616, challenge_id: 37, participant_id: 3272, score: nil, created_at: "2018-08-16 16:02:34", updated_at: "2018-08-16 16:03:53", score_secondary: nil, grading_status_cd: "failed", description_markdown: "", post_challenge: false, challenge_round_id: 52, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},

    # Challenge 30

    {id: 12766, challenge_id: 30, participant_id: 1051, score: 3.0, created_at: "2018-08-09 02:13:18", updated_at: "2018-08-09 04:59:15", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13119, challenge_id: 30, participant_id: 1054, score: 5.0, created_at: "2018-08-12 23:28:11", updated_at: "2018-08-12 23:46:53", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12444, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-06 13:44:47", updated_at: "2018-08-06 14:47:04", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12781, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-09 04:58:57", updated_at: "2018-08-09 07:01:22", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12304, challenge_id: 30, participant_id: 1051, score: 4.0, created_at: "2018-08-05 14:16:32", updated_at: "2018-08-05 17:27:55", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13023, challenge_id: 30, participant_id: 1054, score: nil, created_at: "2018-08-11 15:16:59", updated_at: "2018-08-11 15:17:43", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12334, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-06 01:58:06", updated_at: "2018-08-06 02:00:08", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11981, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-02 12:10:09", updated_at: "2018-08-02 12:18:48", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13050, challenge_id: 30, participant_id: 5442, score: 3.5, created_at: "2018-08-11 23:06:11", updated_at: "2018-08-11 23:20:25", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12272, challenge_id: 30, participant_id: 1780, score: 4.5, created_at: "2018-08-05 05:44:55", updated_at: "2018-08-05 08:56:58", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11645, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-29 15:09:25", updated_at: "2018-07-29 15:34:38", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12207, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-04 02:35:10", updated_at: "2018-08-04 02:58:00", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11614, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:39:32", updated_at: "2018-07-28 21:39:39", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11480, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:37:05", updated_at: "2018-07-25 19:37:14", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11479, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:27:30", updated_at: "2018-07-25 19:30:09", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12744, challenge_id: 30, participant_id: 5442, score: 2.5, created_at: "2018-08-08 23:03:13", updated_at: "2018-08-08 23:44:30", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 11534, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-26 21:16:14", updated_at: "2018-07-26 21:18:19", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12538, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-07 04:03:55", updated_at: "2018-08-07 04:39:33", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12365, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-06 07:24:02", updated_at: "2018-08-06 07:40:21", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12605, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-07 10:01:03", updated_at: "2018-08-07 10:03:58", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11659, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-30 01:58:25", updated_at: "2018-07-30 02:00:20", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12672, challenge_id: 30, participant_id: 5442, score: 2.5, created_at: "2018-08-07 23:21:19", updated_at: "2018-08-07 23:35:50", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 13120, challenge_id: 30, participant_id: 5442, score: 3.5, created_at: "2018-08-12 23:31:24", updated_at: "2018-08-12 23:48:52", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13093, challenge_id: 30, participant_id: 4913, score: 2.5, created_at: "2018-08-12 17:05:07", updated_at: "2018-08-12 17:21:46", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 11745, challenge_id: 30, participant_id: 5442, score: 4.0, created_at: "2018-07-31 00:12:15", updated_at: "2018-07-31 00:26:34", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12267, challenge_id: 30, participant_id: 1780, score: nil, created_at: "2018-08-05 04:05:27", updated_at: "2018-08-05 04:14:04", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11961, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-02 06:14:07", updated_at: "2018-08-02 06:14:08", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 10962, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-18 08:27:31", updated_at: "2018-07-18 09:01:12", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12527, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-07 02:20:15", updated_at: "2018-08-07 02:23:41", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12903, challenge_id: 30, participant_id: 6792, score: nil, created_at: "2018-08-10 09:31:45", updated_at: "2018-08-10 09:47:18", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12529, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-07 02:27:49", updated_at: "2018-08-07 03:27:03", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11050, challenge_id: 30, participant_id: 7, score: 5.0, created_at: "2018-07-19 15:22:56", updated_at: "2018-07-19 15:41:15", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11596, challenge_id: 30, participant_id: 5984, score: 5.0, created_at: "2018-07-28 07:29:38", updated_at: "2018-07-28 07:48:13", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11042, challenge_id: 30, participant_id: 4839, score: 5.0, created_at: "2018-07-19 12:48:05", updated_at: "2018-07-19 13:05:30", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11902, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 14:04:02", updated_at: "2018-08-01 14:04:28", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12268, challenge_id: 30, participant_id: 1780, score: nil, created_at: "2018-08-05 04:19:27", updated_at: "2018-08-05 04:27:27", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11616, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:45:06", updated_at: "2018-07-28 21:45:13", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12888, challenge_id: 30, participant_id: 6792, score: nil, created_at: "2018-08-10 05:43:09", updated_at: "2018-08-10 05:55:53", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11651, challenge_id: 30, participant_id: 4839, score: 5.0, created_at: "2018-07-29 17:17:10", updated_at: "2018-07-29 17:36:26", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11674, challenge_id: 30, participant_id: 1, score: 5.0, created_at: "2018-07-30 07:39:02", updated_at: "2018-07-30 07:57:20", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12373, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 08:17:15", updated_at: "2018-08-06 08:17:15", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12261, challenge_id: 30, participant_id: 1780, score: 4.5, created_at: "2018-08-05 01:21:41", updated_at: "2018-08-05 04:16:46", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11606, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 14:41:11", updated_at: "2018-07-28 14:43:11", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12564, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-07 07:56:24", updated_at: "2018-08-07 07:56:56", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11752, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-31 03:39:41", updated_at: "2018-07-31 04:35:00", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12570, challenge_id: 30, participant_id: 4913, score: 5.0, created_at: "2018-08-07 08:14:12", updated_at: "2018-08-07 08:33:44", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11690, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-30 12:57:30", updated_at: "2018-07-30 13:23:21", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12295, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-05 12:07:43", updated_at: "2018-08-05 13:45:42", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12965, challenge_id: 30, participant_id: 5442, score: 3.0, created_at: "2018-08-10 23:05:08", updated_at: "2018-08-10 23:18:46", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12831, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-08-09 15:10:08", updated_at: "2018-08-09 15:11:24", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12999, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-11 08:55:31", updated_at: "2018-08-11 08:55:40", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12922, challenge_id: 30, participant_id: 5579, score: 5.0, created_at: "2018-08-10 15:13:07", updated_at: "2018-08-10 15:32:38", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11531, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-26 18:49:12", updated_at: "2018-07-26 18:51:22", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13002, challenge_id: 30, participant_id: 1051, score: 2.0, created_at: "2018-08-11 10:06:23", updated_at: "2018-08-11 12:23:01", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 12331, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-06 01:50:56", updated_at: "2018-08-06 01:51:09", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11492, challenge_id: 30, participant_id: 5442, score: 4.5, created_at: "2018-07-26 00:16:06", updated_at: "2018-07-26 00:30:01", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11900, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:56:03", updated_at: "2018-08-01 13:56:20", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12875, challenge_id: 30, participant_id: 1051, score: 1.0, created_at: "2018-08-10 02:14:48", updated_at: "2018-08-10 04:05:49", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 1.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 11650, challenge_id: 30, participant_id: 4839, score: nil, created_at: "2018-07-29 17:03:36", updated_at: "2018-07-29 17:12:34", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12714, challenge_id: 30, participant_id: 4913, score: 4.5, created_at: "2018-08-08 13:00:58", updated_at: "2018-08-08 13:14:05", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11663, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-30 02:29:23", updated_at: "2018-07-30 02:31:16", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12620, challenge_id: 30, participant_id: 5366, score: 3.0, created_at: "2018-08-07 13:04:45", updated_at: "2018-08-07 13:26:25", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12667, challenge_id: 30, participant_id: 5442, score: 2.5, created_at: "2018-08-07 23:02:08", updated_at: "2018-08-07 23:15:07", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 12854, challenge_id: 30, participant_id: 5442, score: 3.0, created_at: "2018-08-09 23:04:49", updated_at: "2018-08-09 23:17:29", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11894, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:37:18", updated_at: "2018-08-01 13:39:10", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11965, challenge_id: 30, participant_id: 374, score: 5.0, created_at: "2018-08-02 06:55:17", updated_at: "2018-08-02 07:14:14", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12271, challenge_id: 30, participant_id: 1780, score: 4.5, created_at: "2018-08-05 05:32:29", updated_at: "2018-08-05 08:20:14", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 10987, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-18 13:11:28", updated_at: "2018-07-18 13:49:31", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12400, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-06 10:22:13", updated_at: "2018-08-06 10:22:13", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11612, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:36:32", updated_at: "2018-07-28 21:36:41", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12827, challenge_id: 30, participant_id: 5579, score: nil, created_at: "2018-08-09 15:04:03", updated_at: "2018-08-09 20:05:54", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11615, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:42:23", updated_at: "2018-07-28 21:42:30", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11459, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 10:44:38", updated_at: "2018-07-25 10:45:24", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12633, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-07 14:15:42", updated_at: "2018-08-07 15:25:03", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11400, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-24 12:44:26", updated_at: "2018-07-24 13:02:51", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 10965, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-18 09:14:10", updated_at: "2018-07-18 09:51:25", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12616, challenge_id: 30, participant_id: 5366, score: 3.5, created_at: "2018-08-07 12:02:45", updated_at: "2018-08-07 12:35:56", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11642, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-29 14:40:42", updated_at: "2018-07-29 14:43:45", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11658, challenge_id: 30, participant_id: 4839, score: 4.5, created_at: "2018-07-30 00:29:32", updated_at: "2018-07-30 00:39:20", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12967, challenge_id: 30, participant_id: 5442, score: 3.0, created_at: "2018-08-10 23:29:12", updated_at: "2018-08-10 23:43:16", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12923, challenge_id: 30, participant_id: 4913, score: 3.5, created_at: "2018-08-10 15:29:49", updated_at: "2018-08-10 15:46:51", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11580, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-27 14:03:45", updated_at: "2018-07-27 14:05:48", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11899, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:52:03", updated_at: "2018-08-01 13:52:18", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11975, challenge_id: 30, participant_id: 5984, score: 5.0, created_at: "2018-08-02 09:45:32", updated_at: "2018-08-02 10:03:24", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11657, challenge_id: 30, participant_id: 4839, score: 4.5, created_at: "2018-07-30 00:13:44", updated_at: "2018-07-30 00:24:07", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12856, challenge_id: 30, participant_id: 5442, score: 3.0, created_at: "2018-08-09 23:28:08", updated_at: "2018-08-09 23:41:22", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13078, challenge_id: 30, participant_id: 4913, score: 3.5, created_at: "2018-08-12 13:22:14", updated_at: "2018-08-12 15:21:18", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12992, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-11 08:58:36", updated_at: "2018-08-11 08:59:26", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13109, challenge_id: 30, participant_id: 5366, score: 3.5, created_at: "2018-08-12 20:18:50", updated_at: "2018-08-12 20:49:56", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12367, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-06 07:31:04", updated_at: "2018-08-06 07:31:04", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11532, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-26 19:41:42", updated_at: "2018-07-26 19:43:53", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12917, challenge_id: 30, participant_id: 5471, score: nil, created_at: "2018-08-10 13:41:41", updated_at: "2018-08-10 13:46:14", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12302, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-05 14:02:35", updated_at: "2018-08-05 14:11:11", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11896, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:44:28", updated_at: "2018-08-01 13:44:45", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12703, challenge_id: 30, participant_id: 1051, score: 2.5, created_at: "2018-08-08 10:59:02", updated_at: "2018-08-08 13:24:46", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 11662, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-30 02:18:27", updated_at: "2018-07-30 02:20:22", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12746, challenge_id: 30, participant_id: 5442, score: 2.5, created_at: "2018-08-08 23:27:10", updated_at: "2018-08-08 23:54:49", score_secondary: 2.5, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.5, score_secondary_display: 2.5, baseline: false, baseline_comment: nil},
    {id: 11576, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-27 13:46:21", updated_at: "2018-07-27 13:46:31", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11976, challenge_id: 30, participant_id: 5984, score: 5.0, created_at: "2018-08-02 09:52:50", updated_at: "2018-08-02 10:13:13", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11482, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:49:18", updated_at: "2018-07-25 19:49:29", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12090, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-03 07:24:03", updated_at: "2018-08-03 07:37:48", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12294, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-05 12:04:47", updated_at: "2018-08-05 12:06:44", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11907, challenge_id: 30, participant_id: 1780, score: nil, created_at: "2018-08-01 15:40:41", updated_at: "2018-08-01 15:42:01", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11897, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:48:17", updated_at: "2018-08-01 13:48:32", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 10935, challenge_id: 30, participant_id: 7, score: 5.0, created_at: "2018-07-17 16:06:05", updated_at: "2018-07-17 16:30:48", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13008, challenge_id: 30, participant_id: 5366, score: 3.5, created_at: "2018-08-11 12:32:23", updated_at: "2018-08-11 12:58:36", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12858, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-09 23:39:08", updated_at: "2018-08-09 23:46:16", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11457, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 10:07:14", updated_at: "2018-07-25 10:08:00", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11610, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 19:06:53", updated_at: "2018-07-28 19:08:56", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11649, challenge_id: 30, participant_id: 4839, score: nil, created_at: "2018-07-29 16:59:28", updated_at: "2018-07-29 17:00:15", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11044, challenge_id: 30, participant_id: 7, score: 5.0, created_at: "2018-07-19 14:17:54", updated_at: "2018-07-19 14:37:02", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12997, challenge_id: 30, participant_id: 7453, score: 5.0, created_at: "2018-08-11 09:46:57", updated_at: "2018-08-11 09:57:49", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12239, challenge_id: 30, participant_id: 1780, score: nil, created_at: "2018-08-04 15:22:41", updated_at: "2018-08-04 15:45:19", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12076, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-03 04:59:56", updated_at: "2018-08-03 05:11:24", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12343, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 04:13:58", updated_at: "2018-08-06 05:07:18", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12266, challenge_id: 30, participant_id: 1780, score: nil, created_at: "2018-08-05 03:27:44", updated_at: "2018-08-05 03:36:30", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11641, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-29 14:15:25", updated_at: "2018-07-29 14:20:09", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11491, challenge_id: 30, participant_id: 5442, score: nil, created_at: "2018-07-25 23:59:27", updated_at: "2018-07-26 00:05:32", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11601, challenge_id: 30, participant_id: 5984, score: 5.0, created_at: "2018-07-28 09:03:10", updated_at: "2018-07-28 09:20:57", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12210, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-04 07:54:56", updated_at: "2018-08-04 08:19:40", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11476, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:15:23", updated_at: "2018-07-25 19:15:38", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11970, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-08-02 07:47:05", updated_at: "2018-08-02 10:14:18", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12908, challenge_id: 30, participant_id: 1051, score: 2.0, created_at: "2018-08-10 11:39:09", updated_at: "2018-08-10 13:36:16", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 12523, challenge_id: 30, participant_id: 1051, score: 1.0, created_at: "2018-08-07 01:28:56", updated_at: "2018-08-07 04:09:41", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 1.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 12349, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 05:19:57", updated_at: "2018-08-06 06:17:57", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12371, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-06 08:00:54", updated_at: "2018-08-06 08:00:54", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13116, challenge_id: 30, participant_id: 5442, score: 2.0, created_at: "2018-08-12 23:07:10", updated_at: "2018-08-12 23:19:26", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 2.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 13118, challenge_id: 30, participant_id: 5366, score: 3.0, created_at: "2018-08-12 23:21:34", updated_at: "2018-08-12 23:44:20", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 13007, challenge_id: 30, participant_id: 1051, score: 3.0, created_at: "2018-08-11 12:31:58", updated_at: "2018-08-11 15:06:37", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11496, challenge_id: 30, participant_id: 5442, score: nil, created_at: "2018-07-26 02:02:20", updated_at: "2018-07-26 02:07:30", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11648, challenge_id: 30, participant_id: 6625, score: 5.0, created_at: "2018-07-29 16:56:51", updated_at: "2018-07-29 17:14:58", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12833, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-08-09 15:19:35", updated_at: "2018-08-09 15:19:52", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11677, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-30 10:38:28", updated_at: "2018-07-30 11:05:46", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11716, challenge_id: 30, participant_id: 1, score: 5.0, created_at: "2018-07-30 14:24:29", updated_at: "2018-07-30 14:42:20", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 10978, challenge_id: 30, participant_id: 5471, score: nil, created_at: "2018-07-18 09:58:35", updated_at: "2018-07-18 10:07:46", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12560, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-07 07:05:56", updated_at: "2018-08-07 07:09:03", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 10960, challenge_id: 30, participant_id: 5471, score: nil, created_at: "2018-07-18 07:51:47", updated_at: "2018-07-18 08:00:51", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12235, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-04 13:39:47", updated_at: "2018-08-04 14:04:40", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11484, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:53:25", updated_at: "2018-07-25 19:54:57", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11495, challenge_id: 30, participant_id: 5442, score: nil, created_at: "2018-07-26 01:50:47", updated_at: "2018-07-26 01:56:16", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11748, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-07-31 02:55:33", updated_at: "2018-07-31 03:11:44", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12921, challenge_id: 30, participant_id: 5471, score: nil, created_at: "2018-08-10 15:07:23", updated_at: "2018-08-10 15:11:42", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12204, challenge_id: 30, participant_id: 5442, score: 4.0, created_at: "2018-08-04 01:23:14", updated_at: "2018-08-04 01:40:13", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11252, challenge_id: 30, participant_id: 6439, score: 5.0, created_at: "2018-07-20 21:56:14", updated_at: "2018-07-20 22:13:39", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12801, challenge_id: 30, participant_id: 1051, score: 4.0, created_at: "2018-08-09 11:19:13", updated_at: "2018-08-09 14:31:21", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11602, challenge_id: 30, participant_id: 5984, score: nil, created_at: "2018-07-28 09:52:00", updated_at: "2018-07-28 14:52:30", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12324, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 00:16:41", updated_at: "2018-08-06 00:19:08", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12375, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 08:22:52", updated_at: "2018-08-06 08:35:32", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12323, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 00:14:40", updated_at: "2018-08-06 00:23:53", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12572, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-07 08:26:19", updated_at: "2018-08-07 09:29:25", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11652, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-29 21:31:35", updated_at: "2018-07-29 21:56:29", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12882, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-10 03:36:00", updated_at: "2018-08-10 08:05:35", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12348, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 05:18:29", updated_at: "2018-08-06 06:30:41", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12611, challenge_id: 30, participant_id: 5366, score: 3.5, created_at: "2018-08-07 11:36:46", updated_at: "2018-08-07 12:11:18", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12563, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-07 07:45:12", updated_at: "2018-08-07 08:19:03", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11634, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-29 06:34:48", updated_at: "2018-07-29 06:38:48", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12411, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-06 11:51:11", updated_at: "2018-08-06 12:33:56", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12340, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-06 02:47:37", updated_at: "2018-08-06 04:16:35", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13068, challenge_id: 30, participant_id: 1051, score: 1.0, created_at: "2018-08-12 10:09:07", updated_at: "2018-08-12 12:07:52", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 1.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 13052, challenge_id: 30, participant_id: 5442, score: 3.0, created_at: "2018-08-11 23:30:12", updated_at: "2018-08-11 23:43:18", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11595, challenge_id: 30, participant_id: 5984, score: 5.0, created_at: "2018-07-28 06:25:22", updated_at: "2018-07-28 06:43:11", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11483, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:50:53", updated_at: "2018-07-25 19:51:12", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12487, challenge_id: 30, participant_id: 5366, score: 3.5, created_at: "2018-08-06 18:32:38", updated_at: "2018-08-06 19:06:22", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12449, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-06 14:15:56", updated_at: "2018-08-06 15:18:36", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11617, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:47:14", updated_at: "2018-07-28 21:47:22", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12569, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-07 08:13:52", updated_at: "2018-08-07 08:17:10", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 13072, challenge_id: 30, participant_id: 1051, score: 1.0, created_at: "2018-08-12 12:34:17", updated_at: "2018-08-12 17:26:30", score_secondary: 0.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 1.0, score_secondary_display: 0.0, baseline: false, baseline_comment: nil},
    {id: 11638, challenge_id: 30, participant_id: 5593, score: 5.0, created_at: "2018-07-29 11:37:43", updated_at: "2018-07-29 11:55:15", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11543, challenge_id: 30, participant_id: 5442, score: 3.5, created_at: "2018-07-26 22:59:43", updated_at: "2018-07-26 23:13:04", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11536, challenge_id: 30, participant_id: 5442, score: 4.5, created_at: "2018-07-26 22:00:53", updated_at: "2018-07-26 22:15:39", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 10936, challenge_id: 30, participant_id: 4839, score: 5.0, created_at: "2018-07-17 16:20:23", updated_at: "2018-07-17 16:40:27", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11901, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:58:38", updated_at: "2018-08-01 13:59:00", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11458, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 10:29:04", updated_at: "2018-07-25 10:29:49", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12734, challenge_id: 30, participant_id: 7230, score: nil, created_at: "2018-08-08 18:46:39", updated_at: "2018-08-08 18:46:47", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11754, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-31 03:42:59", updated_at: "2018-07-31 04:35:49", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11613, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:38:03", updated_at: "2018-07-28 21:38:12", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11898, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 13:50:16", updated_at: "2018-08-01 13:50:40", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12543, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-08-07 04:43:42", updated_at: "2018-08-07 05:18:05", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11904, challenge_id: 30, participant_id: 1051, score: nil, created_at: "2018-08-01 14:15:57", updated_at: "2018-08-01 14:22:22", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11481, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-25 19:45:10", updated_at: "2018-07-25 19:45:19", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11577, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-27 13:49:30", updated_at: "2018-07-27 13:49:37", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11647, challenge_id: 30, participant_id: 4839, score: nil, created_at: "2018-07-29 16:55:58", updated_at: "2018-07-29 16:56:43", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12773, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-08-09 03:06:57", updated_at: "2018-08-09 06:57:38", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12820, challenge_id: 30, participant_id: 4913, score: nil, created_at: "2018-08-09 14:15:29", updated_at: "2018-08-09 19:23:52", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11646, challenge_id: 30, participant_id: 6625, score: nil, created_at: "2018-07-29 16:07:25", updated_at: "2018-07-29 16:12:05", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12869, challenge_id: 30, participant_id: 5366, score: 4.0, created_at: "2018-08-10 01:34:57", updated_at: "2018-08-10 02:06:14", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11656, challenge_id: 30, participant_id: 2, score: 5.0, created_at: "2018-07-30 00:01:24", updated_at: "2018-07-30 00:26:22", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11022, challenge_id: 30, participant_id: 5471, score: 5.0, created_at: "2018-07-19 03:33:16", updated_at: "2018-07-19 04:02:02", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12778, challenge_id: 30, participant_id: 1054, score: nil, created_at: "2018-08-09 03:44:38", updated_at: "2018-08-09 03:44:39", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12427, challenge_id: 30, participant_id: 7294, score: 5.0, created_at: "2018-08-06 13:10:16", updated_at: "2018-08-06 13:29:53", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11777, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-31 08:45:12", updated_at: "2018-07-31 09:41:49", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12757, challenge_id: 30, participant_id: 5366, score: 4.5, created_at: "2018-08-09 00:46:58", updated_at: "2018-08-09 02:01:11", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11578, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-27 13:50:31", updated_at: "2018-07-27 13:52:37", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11548, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-26 23:15:59", updated_at: "2018-07-26 23:17:56", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 10967, challenge_id: 30, participant_id: 6791, score: 5.0, created_at: "2018-07-18 09:19:08", updated_at: "2018-07-18 09:53:24", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 10959, challenge_id: 30, participant_id: 6791, score: nil, created_at: "2018-07-18 07:35:01", updated_at: "2018-07-18 07:50:23", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12733, challenge_id: 30, participant_id: 7230, score: nil, created_at: "2018-08-08 17:39:23", updated_at: "2018-08-08 17:39:31", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 11045, challenge_id: 30, participant_id: 3272, score: 5.0, created_at: "2018-07-19 14:24:45", updated_at: "2018-07-19 14:43:58", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 5.0, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12541, challenge_id: 30, participant_id: 1051, score: 3.5, created_at: "2018-08-07 04:21:11", updated_at: "2018-08-07 07:48:05", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 3.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 11618, challenge_id: 30, participant_id: 2, score: nil, created_at: "2018-07-28 21:51:52", updated_at: "2018-07-28 21:52:01", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12330, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-06 01:43:15", updated_at: "2018-08-06 01:44:32", score_secondary: nil, grading_status_cd: "failed", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12823, challenge_id: 37, participant_id: 1, score: nil, created_at: "2018-08-09 14:35:24", updated_at: "2018-08-09 14:36:38", score_secondary: nil, grading_status_cd: "failed", description_markdown: "Test", post_challenge: false, challenge_round_id: 52, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 1163, challenge_id: 30, participant_id: 1817, score: 0.0, created_at: "2017-08-05 06:18:20", updated_at: "2018-02-20 15:20:57", score_secondary: nil, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 1, score_display: 0.0, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12336, challenge_id: 30, participant_id: 5366, score: 4.5, created_at: "2018-08-06 02:18:41", updated_at: "2018-08-06 03:05:52", score_secondary: 5.0, grading_status_cd: "graded", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: 4.5, score_secondary_display: 5.0, baseline: false, baseline_comment: nil},
    {id: 12447, challenge_id: 30, participant_id: 5366, score: nil, created_at: "2018-08-06 13:56:35", updated_at: "2018-08-06 13:56:35", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},
    {id: 12448, challenge_id: 30, participant_id: 112233, score: nil, created_at: "2018-08-06 13:56:35", updated_at: "2018-08-06 13:56:45", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, challenge_round_id: 32, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil},

    # Challenge 100 (Spotify)
    {id: 19449, challenge_id: 100, participant_id: 112233, score: nil, created_at: "2018-08-06 13:56:35", updated_at: "2018-08-06 13:56:45", score_secondary: nil, grading_status_cd: "submitted", description_markdown: nil, post_challenge: false, score_display: nil, score_secondary_display: nil, baseline: false, baseline_comment: nil}
  ])

  # Calculate Leaderboards
  [52,32,42].each do |id|
    CalculateLeaderboardService.new(challenge_round_id: id).call
  end

  Blog.create!(
    id: 87,
      participant_id: 1,
      title: "Blog number 1",
      body: "This is a sample blog for testing, it belongs to participant p1",
      published: true,
      vote_count: 29,
      view_count: 200,
      seq: 2993,
      posted_at: Time.now)

  Blog.create!(
      id: 1,
        participant_id: 1817,
        title: "Blog number 4",
        body: "This is a sample blog for testing, it belongs to participant p1817",
        published: true,
        vote_count: 2900,
        view_count: 200000,
        seq: 2222,
        posted_at: Time.now)

  Blog.create!(
      id: 3,
        participant_id: 1780,
        title: "Blog number 3",
        body: "This is a sample blog for testing, it belongs to participant p1780",
        published: true,
        vote_count: 291,
        view_count: 200,
        seq: 3000,
        posted_at: Time.now)

  Blog.create!(
    id: 91,
      participant_id: 1051,
      title: "Blog number 2",
      body: "This is a sample blog for testing, it belongs to participant p1051. This participant belongs to an orgnization.",
      published: true,
      vote_count: 14,
      view_count: 231,
      seq: 2231,
      posted_at: Time.now)

  JobPosting.create!(
    id: 102,
    title: "Job posting 1",
    organisation: "Cloud AI",
    contact_name: "J.J. Thompson",
    contact_email: "jjthompson@atom.com",
    contact_phone: "666-999-666",
    posting_date: "2018-08-06",
    closing_date: "2019-11-06",
    status_cd: "open",
    description: "Guy needed to build new elements using generative networks",
    location: "Bangalore",
    country: "India",
    page_views: 1234,
    created_at: Time.now,
    job_url: "www.atomsforu.com"
    )

  JobPosting.create!(
    id: 105,
    title: "Job posting 2",
    organisation: "Cloud AI",
    contact_name: "J.G. Thompson",
    contact_email: "jgthompson@atom.com",
    contact_phone: "666-999-666",
    posting_date: "2018-08-06",
    closing_date: "2018-11-06",
    status_cd: "closed",
    description: "Guy needed to build new DNA samples using generative networks",
    location: "Bangalore",
    country: "India",
    page_views: 1234,
    created_at: Time.now,
    job_url: "www.dnaforu.com"
    )

  Topic.create!(
    id: 123130,
    challenge_id: 100,
    participant_id: 112233,
    topic: "Test Topic",
    views: 123,
    posts_count: 12,
    slug: "Test topic",
    vote_count: 231)

  Comment.create!(
    id: 287832,
    topic_id: 123130,
    participant_id: 112233,
    comment: "This is a test comment",
    vote_count: 12,
    slug: "Test comment",
    comment_markdown: "Test comment"
    )

  ChallengeCall.create!(
    id: 1231232,
    title: "test_challenge_call",
    website: "https://www.challenge_call.example.com",
    description: "This is a test challenge call",
    organizer_id: 21,
    crowdai: true,
    headline: "Headline for challenge call",
    closing_date: Time.parse("20-10-2020")
    )

end
