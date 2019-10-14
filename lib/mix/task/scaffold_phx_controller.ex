defmodule Mix.Tasks.ScaffoldView do
  use Mix.Task

  def run([view_name]) do
    host_app = Mix.Project.config()[:app]
    ScaffoldingEngine.generate_view(view_name, host_app)
  end
end
