defmodule Example.Broker.Publisher do

  def publish(queue, message, opts \\ []) do
    module = Application.get_env(:rabbit_example, Example.Publisher)
    module.publish(queue, message, opts)

    :ok
  end
end
