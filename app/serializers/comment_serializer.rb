include ActionView::Helpers::DateHelper
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :score, :creator, :time_ago

  def creator
    "#{object.user.email}"
  end

  def time_ago
    "#{time_ago_in_words(object.created_at)} ago"
  end
end
