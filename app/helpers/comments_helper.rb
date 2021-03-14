module CommentsHelper
  def render_with_hashtags(comment)
    comment.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/comment/hashtag/#{word.delete("#＃")}", class: "btn btn-gradient"}.html_safe
  end
end
