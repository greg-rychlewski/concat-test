defprotocol ConcatTest do
  def concat(enumberables)
end

defimpl ConcatTest, for: List do
  def concat(enumerables) do
    if is_list(enumerables) and :lists.all(&is_list/1, enumerables) do
      concat_list(enumerables)
    else
      concat_enum(enumerables)
    end
  end

  defp concat_list(enumerables) do
    :lists.append(enumerables)
  end

  defp concat_enum(enumerables) do
    fun = &[&1 | &2]
    enumerables |> Enum.reduce([], &Enum.reduce(&1, &2, fun)) |> :lists.reverse()
  end
end
