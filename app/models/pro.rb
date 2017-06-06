class Pro < User
  has_one :pro_service, foreign_key: :user_id
  has_many :bids
  has_many :reviews 

  def services
    Service.where(id: pro_service[:service_ids])
  end

  def open_projects
    Project.where(status: :open, service_id: services)
  end

end
