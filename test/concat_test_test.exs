defmodule ConcatTestTest do
  use ExUnit.Case
  doctest ConcatTest

  test "greets the world" do
    assert ConcatTest.hello() == :world
  end
end
