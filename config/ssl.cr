Lucky::ForceSSLHandler.configure do
  settings.enabled = Lucky::Env.production?
end
