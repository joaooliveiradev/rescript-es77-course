//Here i import the types directly, because i can't import types of the user module without using include
//Even if i use open inside the User module, the open keyword just import the types inside that module, but
//doenst export them, if the types are exported, i will catch
open User_Types


//In the Profile module i use include to receive the types from Profile_Types in the Profile and export all
//With this, i catch the types here and match with the structure
open Profile

let user: User_Types.user = {
  name: "John Bravo",
  age: 20,
}

let profile = {
  email: "dsadsa@gmail.com",
  password: "dsdasds"
}
