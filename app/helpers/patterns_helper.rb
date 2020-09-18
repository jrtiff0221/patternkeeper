module PatternsHelper
  def user_id_field(pattern)
    if pattern.users.nil?
      select_tag "pattern[user_id]", options_from_collection_for_select(User.all, :id, :name)
    else
      hidden_field_tag "pattern[user_id]", pattern.user_id
    end
  end
end