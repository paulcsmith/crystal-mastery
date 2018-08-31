Lucky::ForceSSLHandler.configure do |settings|
  settings.enabled = Lucky::Env.production?
end
