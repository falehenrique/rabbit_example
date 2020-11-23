import Config

config :rabbit_example, Example.Broker,
  adapter: ConduitAMQP,
  host: Example.Util.get_str("renminbi_rabbitmq_host", "localhost"),
  port: Example.Util.get_int("renminbi_rabbitmq_port", 5672),
  virtual_host: Example.Util.get_str("renminbi_rabbitmq_virtual_host", "/"),
  username: Example.Util.get_str("renminbi_rabbitmq_username", "guest"),
  password: Example.Util.get_str("renminbi_rabbitmq_password", "guest")

config :rabbit_example, Example.Publisher, Example.Broker.RabbitMQ
