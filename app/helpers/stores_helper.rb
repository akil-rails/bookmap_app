module StoresHelper
  def store_content(store)
    link_to store.name, store
  end
  
  def member_image_name(member)
    if member.avid?
      "member_A.png" 
    elsif member.in_waiver?
      "member_W.png"
    else
      "member_M.png"
    end
  end
end
