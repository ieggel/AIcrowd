class Submission::Cell < Template::Cell
  include LocalTimeHelper

  def entry
    model
  end

  def enable_links_in_raw_text(text)
    return '-' if text.nil?

    value = sanitize(text.gsub(%r{(https?://[\S]+)}, "<a href='\\1'>\\1</a>"))

    return '-' if value.nil?

    return value
  end

  def formatted_value(x)
    format("%.#{entry.challenge_round.score_precision}f", x || 0)
  end

  def grade_class
    if entry.grading_status_cd == 'graded'
      return 'badge-success'
    elsif entry.grading_status_cd == 'initiated'
      return 'badge-gold'
    elsif entry.grading_status_cd == 'submitted'
      return 'badge-gold'
    elsif entry.grading_status_cd == 'ready'
      return 'badge-silver'
    else
      return 'badge-warning'
    end
  end

  def challenge
    @challenge ||= model.challenge
  end

  def participant
    @participant ||= entry.participant
  end
end
