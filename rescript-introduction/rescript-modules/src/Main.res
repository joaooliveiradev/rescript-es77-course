// 1 - *.res are modules.
// 2 - *.res (modules) files needs to have a unique name.
// 3 - *.res we can have modules inside modules
// 4 - *.res the module system doesn't work with export or import
// 5 - Rescript doesn't care about the nested modules, etc, you can have many sub dirs that you want, rescript will find the module anyway

Js.log(Math.sum(10, 20))

Js.log(Math2.sumOutside(10, 20))

//We can made an alias for the modules, here we are create an new module MathTwo,
//but, we are assigning the Math2 module to the new module that we create

//This will only works in this module Main, so we have MathTwo just here, if you use like Main.MathTwo.sum, you will get an error.
module MathTwo = Math2
Js.log(MathTwo.sumOutside(10, 2))

// we can open just an module inside another module
open Math3.Division

Js.log(division(11, 5))

// We can desestructuring functions of an module passing modules to an module functor
let {sumInside} = module(Math2.Math2Test)

//Observations: If you create an file in ReScript without the first letter in capital
//The rescript will consider this file an module, but will only get access in another module with the first letter in capital,
//Same as the others modules
//Just to you know because you should use first letter in capital in every file in rescript

Js.log(Math4.testSum4(1, 5))
//Conventions about namespace working with modules

//There was an convention in ReScript that are used when you have an module which that have so many lines and you want to change some functions
//To another place/file, considering that every file is a module, if we have a module Math and we have a function let say sum, we put this
//function in another file, we should use the name like Math_Sum, after this, to be good, we go to the Math module and put this code
//module Sum = Math_Sum
//doing this, we create a module inside Math that are assign to the other module, so now we can access the Math_Sum by using: Math.Sum
//So good in this way.
