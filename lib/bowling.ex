defmodule Bowling do
	def score(frames) do
		frames |> add_score(0)
	end

	defp add_score([roll, spare, extra], total) when roll + spare == 10 do
		[] |> add_score(total + 10 + extra)
	end

	defp add_score([roll, spare|tail], total) when roll + spare == 10 do
		tail |> add_score(total + 10 + (tail |> List.first))
	end

	defp add_score([10, 10, 10], total) do
		total + 30
	end

	defp add_score([10|tail], total) do
		tail |> add_score(total + 10 + (tail |> Enum.take(2) |> Enum.sum))
	end

	defp add_score([roll, spare|tail], total) do
		tail |> add_score(total + roll + spare)
	end

	defp add_score([], total) do
		total
	end
end
