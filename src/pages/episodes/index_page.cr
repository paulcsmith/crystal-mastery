class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
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
end
