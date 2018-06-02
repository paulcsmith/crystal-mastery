class Series < BaseModel
  table :series do
    column title : String
    column description : String
    has_many episodes : Episode
  end
end
