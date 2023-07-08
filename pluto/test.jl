### A Pluto.jl notebook ###
# v0.19.26

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 0f7f287a-df1c-49ef-8b11-2ed946cdafe6


# ╔═╡ 6803ccda-1c31-11ee-3f33-c5d11b7f690d
x=10

# ╔═╡ 90cc4ca6-901e-49d3-8ebe-3ff24a933efe
y=x^2

# ╔═╡ 8ba980ca-ed23-4fc9-8404-5a8ccac3fd4a
a=1:10

# ╔═╡ 759ec8b9-9ec9-452b-86dc-5520465e3971
typeof(a)

# ╔═╡ 508ee101-402f-4b90-921b-c1bb3d54ce33
friend="paws"

# ╔═╡ 43cf174d-8cde-4a1e-b21b-5ba1d0944c96
md"I feel like our cat needs a **friend**. Let's call them $(friend)."

# ╔═╡ 113ea910-9aca-4742-a55a-4798083a445f
begin
	for x in a
		print(x, " ")
	end
	println()
end

# ╔═╡ 350389c4-84e6-4377-8695-1538df434f74
A = [1 4 6.7; 9 2 2.3; 100.4 6 8]

# ╔═╡ ed450955-e0ee-4725-8cf1-c3200adfda3b
A*A

# ╔═╡ 0dbbbb08-3f4a-4ccc-8ef7-81623d02c930
@bind power_level html"<input type='range'>"

# ╔═╡ 6eb80a78-8803-46a7-a4b0-93d3d455d02e
begin
	power_emoji = "⚡"
	power = repeat(power_emoji, power_level)
end

# ╔═╡ 3d2ddfc8-7e0b-48fe-a46f-af6d7c616604
md"""
# The Title

Of this Pluto book!
"""

# ╔═╡ Cell order:
# ╟─3d2ddfc8-7e0b-48fe-a46f-af6d7c616604
# ╠═0f7f287a-df1c-49ef-8b11-2ed946cdafe6
# ╠═6803ccda-1c31-11ee-3f33-c5d11b7f690d
# ╠═90cc4ca6-901e-49d3-8ebe-3ff24a933efe
# ╠═8ba980ca-ed23-4fc9-8404-5a8ccac3fd4a
# ╠═759ec8b9-9ec9-452b-86dc-5520465e3971
# ╠═43cf174d-8cde-4a1e-b21b-5ba1d0944c96
# ╠═508ee101-402f-4b90-921b-c1bb3d54ce33
# ╠═113ea910-9aca-4742-a55a-4798083a445f
# ╠═350389c4-84e6-4377-8695-1538df434f74
# ╠═ed450955-e0ee-4725-8cf1-c3200adfda3b
# ╠═0dbbbb08-3f4a-4ccc-8ef7-81623d02c930
# ╠═6eb80a78-8803-46a7-a4b0-93d3d455d02e
