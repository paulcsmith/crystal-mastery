class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
    render_episodes
    render_coming_soon_list
    render_stay_up_to_date
  end

  def render_episodes
    h1 "All Episodes", class: "page-title -indented"
    @episodes.each do |episode|
      link Episodes::Show.with(episode), class: "row-block -action" do
        h2 class: "subtitle-text" do
          text "Published "
          time_ago_in_words episode.created_at
          text " ago"
        end
        span episode.title, class: "title"
      end
    end
  end

  def render_coming_soon_list
    h1 "Coming Soon", class: "page-title -indented -pushed-down"
    ul class: "list-block" do
      li "Handling Nil"
      li "Preventing bugs with types"
      li "Intro to macros"
    end
  end

  def render_stay_up_to_date
    h1 class: "page-title -indented -pushed-down" do
      text "Stay in Touch for New Episodes"
      link AboutUs.twitter_url do
        img src: "assets/images/twitter-icon.png", class: "image"
      end
    end
    link AboutUs.twitter_url, class: "row-block -action" do
      span "Follow @crystalmastery on Twitter", class: "title"
    end
  end
end
