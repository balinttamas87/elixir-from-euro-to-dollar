defmodule Budget.Conversion do
	def from_euro_to_dollar(amount) do
		url = "cs-currency-rates.herokuapp.com/currency-rates"
		case HTTPoison.get(url) do
			{:ok, response} -> parse(response) |> convert(amount)
			{:error, _} -> "Error fetching rates" 
		end
	end

	defp parse(%{status_code: 200, body: json_response}) do
		Poison.Parse.parse(json_response)
	end
end
