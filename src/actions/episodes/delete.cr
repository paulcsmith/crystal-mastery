class Episodes::Delete < BrowserAction
  action do
    EpisodeQuery.find(id).delete
    redirect Episodes::Index
  end
end
