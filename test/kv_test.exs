defmodule KVTest do
  use ExUnit.Case

  test "Testing Server Process with KV Store" do
    pid = ServerProcess.start(KVStore)
    put_res = ServerProcess.call(pid, {:put, :hello, :world})
    assert put_res == :ok
    get_res = ServerProcess.call(pid, {:get, :hello})
    assert get_res == :world
  end
end
