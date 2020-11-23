defmodule Example.Broker do
    use Conduit.Broker, otp_app: :rabbit_example

    pipeline :serialize do
      plug(Conduit.Plug.Format)
    end
    configure do
      exchange("notifications", type: :direct, durable: true)

      queue(
        "example.notifications",
        routing_key: "example.notifications",
        exchange: "example_notifications",
        durable: true
      )
    end

    outgoing do
      pipe_through([:serialize])
      publish(:notification, exchange: "notifications", to: "notifications.email")
    end
end
