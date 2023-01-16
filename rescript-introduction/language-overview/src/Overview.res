//Let Bindings && Shadowing
// let value = 10

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
