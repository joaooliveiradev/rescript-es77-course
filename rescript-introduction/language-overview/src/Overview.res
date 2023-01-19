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
type t

//ADT'S || Variants
type cardInfo = {
  name: string,
  ammount: int,
}

type cardType = CreditCard(cardInfo) | DebitCard(cardInfo)

let getCard = (card: cardType) => {
  switch card {
  | CreditCard({name}) => `Your name is ${name} and you have an credit card`
  | DebitCard({name}) => `Your name is ${name} and you have an debit card`
  }
}

let userCard = CreditCard({name: "John", ammount: 10})

let card = getCard(userCard)

//Poly Variants
type profilePoly = {
  name: string,
  age: int,
  role: string,
}

let userProfileWithPoly = #admin({
  name: "JohnPoly",
  age: 10,
  role: "admin",
})

let getProfilePoly = role => {
  switch role {
  | #user => "Hello User"
  | #admin({name, age, role}) =>
    `Hello Admin with name ${name}, with age ${age->Belt.Int.toString} and with ${role} role`
  }
}

let myProfilePoly = getProfilePoly(#user)

//Function

//Fn with Positional Args
//An param can be optional with the =? put you need to make an pattern matching because is an option
let makeProfile = (name, age, ~favoriteColor=?, ()): string => {
  switch favoriteColor {
  | Some(color) =>
    `Your name is ${name} and your age is ${age->Belt.Int.toString} and your favorite color is ${color}`
  | None => `Your name is ${name} and your age is ${age->Belt.Int.toString}`
  }
}

//Rescript has auto curried functions so you can pass the params partially
// if you don't want to curried functions by default, put an .(dot) in the params, ex: let fn = (. x, y, z ) => {}
//More details: https://rescript-lang.org/docs/manual/latest/function

//Curried example
let makeAge = "John"->makeProfile
let getProfile = 21->makeAge
let profile = getProfile(~favoriteColor="White")()
let profile2 = getProfile()
