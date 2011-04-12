class Member < ActiveRecord::Base
  belongs_to :store
  
  def avid?
    plan_id == 40
  end
  
  def in_waiver?
    plan_id == 27
  end
end
