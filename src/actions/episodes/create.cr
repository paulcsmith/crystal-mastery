class Episodes::Create < BrowserAction
  action do
    EpisodeForm.create(params) do |form, episode|
      if episode
        redirect Episodes::Index
      else
        render NewPage, form: form
      end
    end
  end
end
