class Episodes::Create < BrowserAction
  route do
    EpisodeForm.create(params) do |form, episode|
      if episode
        redirect Episodes::Index
      else
        render NewPage, form: form
      end
    end
  end
end
