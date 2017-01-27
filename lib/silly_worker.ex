defmodule SillyWorker do
  @moduledoc false

  @doc """
  Performs the job.

  ## Examples

      iex> SillyWorker.do_work
      :ok

  """

  def do_work do
    # do some work
    # ...
    # ...
    require Logger
    Logger.log(:info, "Job Done")
    :ok
  end
end
