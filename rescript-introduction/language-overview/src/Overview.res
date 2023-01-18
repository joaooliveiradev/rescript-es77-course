//Let Bindings && Shadowing
//let value = 10

let value = "Shadowing"

//Int
let valueInt1 = 1
let valueInt2 = 2

//Float
let valueFloat1 = 1.2
let valueFloat2 = 1.1

//Soma int
let resultInt = valueInt1 + Belt.Float.toInt(valueFloat1)

//Divisão Float
let resultFloat = valueFloat1 /. valueFloat2

//Mod
let resultMod = mod(valueInt1, Belt.Float.toInt(valueFloat2))

//String
let str = "Foo"
let exampleFuncStr = str->Js.String2.endsWith("BA")

//Char
let char = 'F'
let exampleFuncChar = char->Char.compare('B')

let isFalse = false
let isTrue = true

//Array
let numArr = [1, 5, 10]
let byTwo = num => num * 2
let numArrByTwo = numArr->Js.Array2.map(byTwo)

//Tuple
let tupleNum = 1.0

let operation = () => {
  let arr = ["1", "2", "3"]
  let string = "bla"
  (arr, string, 'C')
}

let (arr, string, char) = operation()

//Ref type to mutable some value in RS | doens't confuse with useRef from react that also have in ReScript
//we can pass any type here
let valueMutable = ref(10)
valueMutable.contents = 15

//Records
type profile = {
  name: string,
  age: int,
}

let user1 = {
  name: "Joao",
  age: 21,
}

let user2: ProfileTypes.profile = {
  name: "Joao2",
  age: 22,
}

//Doesn't match, even if the fields are the same, in the typescript will match because the typescript has an structural type system
// let user3: profile = {
//   ...user2,
//   age: 23,
// }
//Error: This has type: ProfileTypes.profile

//Defined Types, similar to generics

type definedTypeProfile<'name, 'age> = {
  name: 'name,
  age: 'age,
  someProp: string,
}

let definedProfileUser = {
  name: ['J', 'O', 'A', 'O'],
  age: (10, 20, 30),
  someProp: "bla",
}

//Spread || Not work in arrays
let someProfile = {
  ...definedProfileUser,
  someProp: "foo",
}

//Phantom type
type t;

