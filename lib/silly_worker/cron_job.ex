defmodule SillyWorker.CronJob do
  use GenServer

  def start_link(module, function, args, interval) do
    GenServer.start_link(__MODULE__, {module, function, args, interval})
  end

  def init({module, function, args, interval}) do
    schedule_work(interval)
    {:ok, {module, function, args, interval}}
  end

  def handle_info(:perform_job, {module, function, args, interval}) do
    apply(module, function, args)
    schedule_work(interval)
    {:noreply, {module, function, args, interval}}
  end

  defp schedule_work(interval) do
    Process.send_after(self(), :perform_job, interval)
  end
end
