class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :cat_id

  def overlapping_requests
  cat.rental_requests
          .where.not(id: self.id)
          .where.not('end_date < ?', start_date)
          .where.not('start_date > ?', end_date)

  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    !overlapping_approved_requests.exists?
  end

  def approve!
    if self.does_not_overlap_approved_request
      self.status = 'APPROVED'
      ActiveRecord::Base.transaction do
        self.save
        self.overlapping_requests.each do |request|
          request.status = 'DENIED'
          request.save
        end
      end
    else
      'Unable to approve request - Conflicting approved request'
    end

  end

end
