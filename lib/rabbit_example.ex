defmodule RabbitExample do

  alias Example.Broker.Publisher
  @moduledoc """
  Documentation for `RabbitExample`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RabbitExample.hello()
      :world

  """
  def hello do
    IO.puts("test teste ")

  publish_result =
    Publisher.publish(
      :notification,
      'teste',
      publisher_confirms: :die
    )
    publish_result
  end
end
