defmodule KVStoreTest do
  use ExUnit.Case

  test "testing abstracted gets and puts of KV Store" do
    pid = KVStore.start()
    put_res = KVStore.put(pid, :hello, :world)
    assert put_res == :ok
    get_res = KVStore.get(pid, :hello)
    assert get_res == :world
  end
end
