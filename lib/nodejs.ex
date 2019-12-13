defmodule NodeJS do
  def start_link(opts \\ []), do: NodeJS.Supervisor.start_link(opts)
  def stop(), do: NodeJS.Supervisor.stop()
  def call(module, args \\ [], opts \\ []), do: NodeJS.Supervisor.call(module, args, opts)
  def call!(module, args \\ [], opts \\ []), do: NodeJS.Supervisor.call!(module, args, opts)
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end
end
