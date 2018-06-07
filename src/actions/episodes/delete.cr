class Episodes::Delete < BrowserAction
  route do
    EpisodeQuery.find(id).delete
    redirect Episodes::Index
  end
end
