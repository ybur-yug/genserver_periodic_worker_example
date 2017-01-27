defmodule SillyWorker.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SillyWorker.CronJob, [SillyWorker, :do_work, [], 1000]),
                                   # run the `do_work` method on `SillyWorker`
                                   # every second with no arguments
    ]

    opts = [strategy: :one_for_one, name: SillyWorker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
