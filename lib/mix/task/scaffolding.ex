defmodule Mix.Tasks.ScaffoldView do
  use Mix.Task

  def run([view_name]) do
    IO.puts "Creando tu view #{view_name}, gracias por usar esto!"
    res = System.cmd("pwd", [])
    IO.inspect res
  end
end
