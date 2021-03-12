defmodule ListFilter do
  @moduledoc """
  Module to count odd numbers of lists.
  """

  @doc """
  Counts how many odd numbers are in a given list.

  ## Examples

      iex> ListFilter.call([])
      0
      iex> ListFilter.call([4, 2])
      0
      iex> ListFilter.call([3.1415])
      0
      iex> ListFilter.call(["3"])
      1
      iex> ListFilter.call(["banana", 3])
      1
      iex> ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
      3
  """
  def call(list) do
    list
    |> Enum.flat_map(fn x -> map_integer(x) end)
    |> Enum.filter(fn x -> odd?(x) end)
    |> Enum.count()
  end

  defp map_integer(string) when is_binary(string) do
    case Integer.parse(string) do
      {int, _rest} -> [int]
      :error -> []
    end
  end

  defp map_integer(number) when is_integer(number), do: [number]

  defp map_integer(_other), do: []

  defp odd?(number), do: rem(number, 2) != 0
end
