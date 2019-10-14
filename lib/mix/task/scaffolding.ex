defmodule Mix.Tasks.ScaffoldView do
  use Mix.Task

  def run([view_name]) do
		ScaffoldingEngine.generate_view(view_name)
  end
end
