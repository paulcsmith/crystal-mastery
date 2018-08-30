class Episodes::Delete < BrowserAction
  include Auth::RequireAdmin

  route do
    EpisodeQuery.find(id).delete
    redirect Episodes::Index
  end
end
