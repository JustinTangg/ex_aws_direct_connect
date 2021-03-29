defmodule ExAws.DirectConnect do
  @moduledoc """
  Operations on AWS Direct Connections
  """
  use ExAws.Utils,
    format_type: :xml,
    non_standard_keys: %{}

  @namespace "OvertureService"

  @doc """
  Displays the specified connection or all connections in this Region.
  """
  @type describe_connections_opts :: [connection_id: binary]
  @spec describe_connections() :: ExAws.Operation.JSON.t()
  @spec describe_connections(opts :: describe_connections_opts) :: ExAws.Operation.JSON.t()
  def describe_connections(opts \\ []) do
    opts |> request(:describe_connections)
  end

  ####################
  # Helper Functions #
  ####################

  defp request(data, action) do
    operation = action |> Atom.to_string() |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :directconnect,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
    )
  end
end
