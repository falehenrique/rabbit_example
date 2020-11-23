import Config

import_config("util.exs")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config("base.exs")

config :rabbit_example,
  env: Mix.env()

import_config "#{Mix.env()}.exs"
