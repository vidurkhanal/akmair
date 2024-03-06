defmodule ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  def loop(callback_module, state) do
    receive do
      {request, caller} ->
        {res, new_state} = callback_module.handle_call(request, state)
        send(caller, {:response, res})
        loop(callback_module, new_state)

      {:stop} ->
        :ok
    end
  end

  def call(server_pid, request) do
    send(server_pid, {request, self()})

    receive do
      {:response, res} -> res
    end
  end
end
