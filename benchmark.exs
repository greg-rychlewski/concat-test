create_list_of_lists = fn num_lists, list_size ->
  Enum.reduce(1..num_lists, [], fn _, acc ->
    [Enum.to_list(1..list_size) | acc]
  end)
end

inputs = %{
  "small" => create_list_of_lists.(10, 10),
  "medium" => create_list_of_lists.(10, 1000),
  "large" => create_list_of_lists.(10, 10000)
}

Benchee.run(
  %{
    "master"    => fn list_of_lists -> Enum.concat(list_of_lists) end,
    "proposal" => fn list_of_lists -> ConcatTest.concat(list_of_lists) end,
  },
  inputs: inputs
)



