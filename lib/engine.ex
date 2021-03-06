defmodule ScaffoldingEngine do

  @doc """
  This function generate the phoenix controller,
  it needs 2 args: the controller name and the app_name (atom)

  This function is called inside the mix tasks

  iex> ScaffoldingEngine.generate_view("page1", :app_name)

  """
  def generate_view(controller_name, app_name) do
    controller_downcase = String.downcase(controller_name)
    controller_capitalized = String.capitalize(controller_name)

    {_mix_project_name, app_name, webapp_name} = ScaffoldingUtil.get_app_names(app_name)

    # Attrs for fill templates
    attrs = [
      webapp_name: webapp_name,
      controller: controller_capitalized,
      controller_downcase: controller_downcase
    ]

    files_to_generate = [
      {"phx_view/controller.eex",
       "lib/#{app_name}_web/controllers/#{controller_downcase}_controller.ex"},
      {"phx_view/view.eex", "lib/#{app_name}_web/views/#{controller_downcase}_view.ex"},
      {"phx_view/index.eex",
       "lib/#{app_name}_web/templates/#{controller_downcase}/index.html.eex"}
    ]

    # Create folder
    _ = System.cmd("mkdir", ["lib/#{app_name}_web/templates/#{controller_downcase}"])

    Enum.each(files_to_generate, fn {file, path} ->
      template = File.stream!(Path.join(:code.priv_dir(:scaffolding), file))
      {:ok, body} = template.path |> File.read()
      content = EEx.eval_string(body, attrs)
      :ok = File.write(path, content)
    end)

    IO.puts(" :: Scaffolding Generator Done! :: ")
    IO.puts("\n Please update your router.ex file adding the follow line:")
    IO.puts("\n >>> get \"/#{controller_downcase}\", #{controller_capitalized}Controller, :index")
  end

  @doc """
  This function generate the phoenix controller,
  it needs 2 args: the controller name and the app_name (atom)

  This function is called inside the mix tasks

  iex> ScaffoldingEngine.generate_live_view("page1", :app_name)

  """
  def generate_live_view(controller_name, app_name) do
    controller_downcase = String.downcase(controller_name)
    controller_capitalized = String.capitalize(controller_name)

    {_mix_project_name, app_name, webapp_name} = ScaffoldingUtil.get_app_names(app_name)

    # Attrs for fill templates
    attrs = [
      webapp_name: webapp_name,
      controller: controller_capitalized,
      controller_downcase: controller_downcase
    ]

    files_to_generate = [
      {"phx_view/live.eex", "lib/#{app_name}_web/live/#{controller_downcase}_live.ex"},
      {"phx_view/view.eex", "lib/#{app_name}_web/views/#{controller_downcase}_view.ex"},
      {"phx_view/live_index.eex",
       "lib/#{app_name}_web/templates/#{controller_downcase}/index.html.leex"}
    ]

    # Create folder for live views and templates
    _ = System.cmd("mkdir", ["lib/#{app_name}_web/live"])
    _ = System.cmd("mkdir", ["lib/#{app_name}_web/templates/#{controller_downcase}"])

    Enum.each(files_to_generate, fn {file, path} ->
      template = File.stream!(Path.join(:code.priv_dir(:scaffolding), file))
      {:ok, body} = template.path |> File.read()
      content = EEx.eval_string(body, attrs)
      :ok = File.write(path, content)
    end)

    IO.puts(" :: Scaffolding Generator Done! :: ")
    IO.puts("\n Please update your router.ex file adding the follow line:")
    IO.puts("\n >>> live \"/#{controller_downcase}\", #{controller_capitalized}Live")
  end
end

defmodule ScaffoldingUtil do
  def get_phx_app_name() do
    mix_project_name = Mix.Project.config()[:app]
    get_app_names(mix_project_name)
  end

  def get_app_names(mix_project_name) do
    app_name =
      mix_project_name
      |> Atom.to_string()
      |> String.split("_")
      |> capitalize.()
      |> Enum.join("")

    web_app_name = "#{app_name}Web"
    app_name_dir = Atom.to_string(mix_project_name)
    {mix_project_name, app_name_dir, web_app_name}
  end

  defp capitalize() do
    fn letters ->
      for letter <- letters, do: String.capitalize(letter)
    end
  end
end
