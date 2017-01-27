defmodule SillyWorkerTest do
  use ExUnit.Case
  doctest SillyWorker

  test "Silly worker does work and returns :ok" do
    assert :ok = SillyWorker.do_work
  end
end
