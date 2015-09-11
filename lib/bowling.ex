defmodule Bowling do
	def score(frames) do
		add_score(frames, 0)
	end

	defp add_score([roll, spare, extra], total) when roll + spare == 10 do
		add_score([], total + 10 + extra)
	end

	defp add_score([roll, spare|tail], total) when roll + spare == 10 do
		add_score(tail, total + 10 + List.first(tail))
	end

	defp add_score([10, 10, 10], total) do
		total + 30
	end

	defp add_score([10|tail], total) do
		add_score(tail, total + 10 + Enum.sum(Enum.take(tail, 2)))
	end

	defp add_score([roll, spare|tail], total) do
		add_score(tail, total + roll + spare)
	end

	defp add_score([], total) do
		total
	end
end
