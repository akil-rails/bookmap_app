class Member < ActiveRecord::Base
  belongs_to :store, :counter_cache => true
  
  def avid?
    [20, 53, 21, 54, 19, 55, 18, 56, 13, 40, 39, 12].include?(plan_id)
  end
  
  def in_waiver?
    plan_id == 26
  end
end
