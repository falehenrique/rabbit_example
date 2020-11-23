defmodule Example.Broker.RabbitMQ do

  import Conduit.Message

  @type headers :: %{String.t() => term()}

  @doc """
  Sends a message to RabbitMQ
  queue -> Matches an atom on outgoing block on your Broker
  content -> Message body
  """
  def publish(queue, content, opts \\ []) do
    {headers, opts} = Keyword.pop(opts, :headers, %{})

    message =
      %Conduit.Message{}
      |> put_body(content)
      |> put_headers(headers)

    case Example.Broker.publish(message, queue, opts) do
      {:ok, _message} ->
        :ok

      error ->
        raise "unable to publish to #{queue}; reason: #{inspect(error, pretty: true)}"
    end
  end
end
