class TimeEntry < ApplicationRecord
  belongs_to :user

  validates :starts_at, presence: true
  validates :finishes_at, presence: true, if: -> { self.persisted? }
  validate :only_one_running, if: -> { self.new_record? } 
  validate :start_at_less_than_finish_at

  private

  def only_one_running
    errors.add(:running, 'already running') if user&.timer_running?
  end

  def start_at_less_than_finish_at
    return unless finishes_at.present?
    errors.add(:finishes_at, 'cannot be earlier than starts at') if finishes_at < starts_at
  end
end
