require "./user"
require "./episode"

class Comment < BaseModel
  table :comments do
    column body : String
    belongs_to author : User
    belongs_to episode : Episode
  end
end
