defmodule ListFilterTest do
  use ExUnit.Case
  doctest ListFilter

  test "should return zero for an empty list" do
    assert ListFilter.call([]) == 0
  end

  test "should return zero for a list without odd numbers" do
    assert ListFilter.call([4, 2]) == 0
  end

  test "should not count decimal numbers" do
    assert ListFilter.call([3.1415]) == 0
  end

  test "should parse strings that represents integers" do
    assert ListFilter.call(["3"]) == 1
  end

  test "should not count strings that arent numbers" do
    assert ListFilter.call(["banana", 3]) == 1
  end

  test "should return one for a list with one odd number" do
    assert ListFilter.call([3]) == 1
  end
end
