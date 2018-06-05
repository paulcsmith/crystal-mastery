require "./series"

class Episode < BaseModel
  table :episodes do
    column title : String
    column video_url : String
    column description : String
    belongs_to series : Series?
    has_many comments : Comment
  end
end
