defmodule Mix.Tasks.ScaffoldView do
  use Mix.Task

  def run([view_name]) do
    IO.puts "Creando tu view #{view_name}, gracias por usar esto!"
    res = System.cmd("pwd", [])
    IO.inspect res
    IO.puts "Trying to get my mix confg"
    IO.inspect Mix.Project.config[:app]
    host_app = Mix.Project.config[:app]
	  IO.puts "creating a dummy folder in your path"
    _ = System.cmd("mkdir", ["lib/dummy_folder"])
		IO.puts "Getting the priv dir from scaffolding"
    IO.inspect :code.priv_dir(:scaffolding)
		IO.puts "getting priv dir from host app"
		IO.inspect :code.priv_dir(host_app)
		IO.puts "--- Done!!"
  end
end
