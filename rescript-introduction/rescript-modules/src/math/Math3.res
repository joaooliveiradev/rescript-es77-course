//Here is the examples with module inside modules

//So the Math3 is an module by itself, but we are creating new modules

module Sum = {
  let sum = (x, y) => x + y
}

module Division = {
  let division = (x, y) => x * y
  // we can have functions which the same name of others modules, because they aren't in the same context
  let sum = (x, y) => x + y
}

module Multiply = {
  let multiply = (x, y) => x * y
}
