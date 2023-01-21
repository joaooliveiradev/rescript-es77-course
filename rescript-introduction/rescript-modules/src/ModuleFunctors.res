//Module Types
module type SumTypes = {
  let sum: (int, int) => int

  let sumFloat: (float, float) => float
}

module Sum: SumTypes = {
  let sum = (x, y) => x + y

  let sumFloat = (a, b) => a +. b
}

//Module Functors also called as Module Functions

//Most simple example, but this example it's not very usefull, we can made the same thing using less code
module CreateMult = () => {
  let mult = (x, y) => x * y
}

module Mult = CreateMult()

let result = Mult.mult(10, 20)

//Better usage of module functors

module type CalcTypes = {
  type t
  let calc: (t, t) => t
}

module MakeCalc = (Mod: CalcTypes) => {
  type t = Mod.t
  let calc = Mod.calc
}

module SumFloat = MakeCalc({
  type t = float
  let calc = (x: t, y: t) => x +. y
})

module SumInt = MakeCalc({
  type t = int
  let calc = (x: t, y: t) => x + y
})

Js.log(SumFloat.calc(1.0, 3.0))
Js.log(SumInt.calc(5, 2))

//Another example Module Functors but to match all types
// like
// if we have an type t, we can make functions that comes with types like: string, int, record shapes, booleans
// but will not match an type like: array<int>
// because the array is an type that receives another type inside with type parameters, and our type, just receive an type without parameters
// to we match the types that receive some parameter, we have to receive the parameter in our type first
// the " type t "  doesn't work
// but if we do like: 
// type<'t> 
// all the types will be match, even if just only a type like: int or string, in this example i use this type <'t> to match an string
// see the line 72 of the ConcatString module
module type ConcatTypes = {
  type t<'t>
  let concat: (t<'t>, t<'t>) => t<'t>
}

module MakeConcat = (Mod: ConcatTypes) => {
  type t<'t> = Mod.t<'t>
  let concat = Mod.concat
}

module ConcatString = MakeConcat({
  type t<'t> = string
  let concat = (x, y) => `${x} ${y}`
})

module ConcatArray = MakeConcat({
  type t<'t> = array<'t>
  let concat = (x: t<'t>, y: t<'t>) => Js.Array2.concat(x, y)
})

Js.log(ConcatString.concat("Hello ", "World"))
Js.log(ConcatArray.concat([1, 2, 3], [4, 5, 6]))
