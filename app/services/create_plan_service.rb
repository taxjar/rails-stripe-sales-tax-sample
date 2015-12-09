class CreatePlanService
  def call
    p1 = Plan.where(name: 'Platinum').first_or_initialize do |p|
      p.amount = 14900
      p.interval = 'month'
      p.stripe_id = 'platinum'
    end
    p1.save!(:validate => false)
    p2 = Plan.where(name: 'Gold').first_or_initialize do |p|
      p.amount = 9900
      p.interval = 'month'
      p.stripe_id = 'gold'
    end
    p2.save!(:validate => false)
    p3 = Plan.where(name: 'Silver').first_or_initialize do |p|
      p.amount = 4900
      p.interval = 'month'
      p.stripe_id = 'silver'
    end
    p3.save!(:validate => false)
  end
end
