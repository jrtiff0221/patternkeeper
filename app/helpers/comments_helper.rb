module CommentsHelper
    def user_id_field(comment)
        if comment.users.nil?
          select_tag "comment[user_id]", options_from_collection_for_select(User.all, :id, :name)
        else
          hidden_field_tag "comment[user_id]", comment.user_id
        end
      end
end
