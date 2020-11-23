defmodule Example.Util do
  def init(_path), do: nil

  def load(config, _any), do: config

  def get_str(env, default \\ "") when is_binary(default) or is_nil(default) do
    case System.get_env(env) do
      nil -> default
      s -> s
    end
  end

  def get_int(env, default \\ 0) when is_number(default) do
    {n, ""} = Integer.parse(get_str(env, to_string(default)))
    n
  end
end
