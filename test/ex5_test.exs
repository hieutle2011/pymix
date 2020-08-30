defmodule Ex5Test do
  use ExUnit.Case

  test "51" do
    assert Ex51.solve() == [
             G: "#4885ed",
             o: "#db3236",
             o: "#f4c20d",
             g: "#4885ed",
             l: "#3cba54",
             e: "#db3236"
           ]
  end

  test "52" do
    assert Ex52.solve() == [
             %{
               name: "Hoang",
               phone: "0988888888",
               languages: ["Python", "C", "SQL", "HTML", "CSS", "JavaScript", "Golang", "Elixir"]
             },
             %{
               name: "Duy",
               languages: ["Python", "C", "SQL", "HTML", "CSS", "JavaScript", "Golang"]
             },
             %{
               name: "Dai",
               girl_friend: "Angela",
               languages: ["Python", "C", "SQL", "HTML", "CSS", "JavaScript", "Golang"]
             },
             %{
               name: "Tu",
               girl_friend: "Do Anh",
               languages: ["Python", "C", "SQL", "HTML", "CSS", "JavaScript", "Golang"]
             }
           ]
  end

  test "53" do
    data = """
    Dictionaries are sometimes found in other languages as “associative memories” or “associative arrays”. Unlike sequences, which are indexed by a range of numbers, dictionaries are indexed by keys, which can be any immutable type; strings and numbers can always be keys. Tuples can be used as keys if they contain only strings, numbers, or tuples; if a tuple contains any mutable object either directly or indirectly, it cannot be used as a key. You can’t use lists as keys, since lists can be modified in place using index assignments, slice assignments.
    """

    res = Ex53.solve(data)
    assert {"be", 5} in res
    assert {"can", 4} in res
    assert length(res) == 10
  end

  describe "Big file" do
    @describetag :slow
    test "54" do
      assert Ex54.solve() == [
               "111111111111111111111111111111\n",
               "59999984\n",
               "111111111111111111111111111111\n",
               "59999988\n",
               "111111111111111111111111111111\n",
               "59999992\n",
               "111111111111111111111111111111\n",
               "59999996\n",
               "111111111111111111111111111111\n",
               "60000000\n"
             ]
    end
  end

  test "56" do
    term1 = %{math: 3, python: 5, data: 2}
    term2 = %{math: 7, python: 9, SQL: 8, HTML: 6}
    res = Ex56.solve(term1, term2)

    assert res[:python] == 9
    assert res[:math] == 7
    assert res[:data] == 2
  end
end
