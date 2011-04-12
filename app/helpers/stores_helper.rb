module StoresHelper
  def store_content(store)
    link_to (store.name, store)
  end
end
