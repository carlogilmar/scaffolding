defmodule ScaffoldingEngine do

	def generate_view(controller_name, app_name) do

		controller_downcase = String.downcase(controller_name)
		controller_capitalized = String.capitalize(controller_name)

		#app_name = "scalathon"
		#app_capitalized = String.capitalize(app_name)
		{mix_project_name, app_name, webapp_name} = ScaffoldingUtil.get_app_names(app_name)

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
			{"phx_view/index.eex", "lib/#{app_name}_web/templates/#{controller_downcase}/index.html.eex"}
		]

		# Create folder
		_ = System.cmd("mkdir", ["lib/#{app_name}_web/templates/#{controller_downcase}"])

		#Enum.each(files_to_generate, fn {file, path} ->
		#  IO.puts("\n Construyendo archivo #{file}")
		#  template = File.stream!(Path.join(:code.priv_dir(:scalathon), file))
		#  {:ok, body} = template.path |> File.read()
		#  content = EEx.eval_string(body, attrs)
		#  IO.inspect(path)

		#  :ok = File.write(path, content)
		#end)
	end
end

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
		app_name_dir = Atom.to_string(mix_project_name)
		{mix_project_name, app_name_dir, web_app_name}
	end

	defp capitalize do
		fn letters ->
			for letter <- letters, do: String.capitalize(letter)
		end
	end

end
