import tidy.forwards_reasoning

lemma G (n : ℕ) : list ℕ := [n]
lemma F : ℕ := 0

section

local attribute [forwards] G

example : 1 = 1 :=
begin 
  success_if_fail { forwards_library_reasoning },
  refl
end

local attribute [forwards] F

example : 1 = 1 :=
begin 
  forwards_library_reasoning,
  forwards_library_reasoning,
  success_if_fail { forwards_library_reasoning },
  refl
end

example : 1 = 1 :=
begin 
  have p := [0],  
  forwards_library_reasoning,
  success_if_fail { forwards_library_reasoning },
  refl
end
end

section
inductive T (n : ℕ)
| t : ℕ → T

@[forwards] lemma H {n : ℕ} (v : T n) : string := "hello"

example : 1 = 1 :=
begin
success_if_fail { forwards_library_reasoning },
have p : T 3 := T.t 3 5,
forwards_library_reasoning,
refl
end

end