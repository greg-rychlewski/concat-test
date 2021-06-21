defprotocol ConcatTest do
  def concat(enumberables)
end

defimpl ConcatTest, for: List do
  def concat(enumerables) do
    if is_list(enumerables) and :lists.all(&is_list/1, enumerables) do
      ConcatHelpers.concat_list(enumerables)
    else
      ConcatHelpers.concat_enum(enumerables)
    end
  end
end

defmodule ConcatHelpers do
  def concat_list(enumerables) do
    :lists.append(enumerables)
  end

  def concat_enum(enumerables) do
    fun = &[&1 | &2]
    enumerables |> Enum.reduce([], &Enum.reduce(&1, &2, fun)) |> :lists.reverse()
  end
end
