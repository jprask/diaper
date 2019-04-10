class PartnerMailerJob < ApplicationJob
  queue_as :default

  def perform(org_id, dist_id, subject)
    current_organization = Organization.find(org_id)
    distribution = Distribution.find(dist_id)
    DistributionMailer.partner_mailer(current_organization, distribution, subject).deliver_now if Rails.env.production?
  end
end
