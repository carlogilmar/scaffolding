defmodule ScaffoldingUtil do

  def get_phx_app_name() do
    mix_project_name = Mix.Project.config[:app]
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
    {mix_project_name, app_name, web_app_name}
  end

  defp capitalize do
    fn letters ->
      for letter <- letters, do: String.capitalize(letter)
    end
  end

end
