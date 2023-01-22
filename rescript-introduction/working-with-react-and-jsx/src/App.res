//Some notes

/*
  @react.component is an ppx that generate some code to us

  if you inspect this code
  module Message = {
  @react.component
  let make = (~msg) => <h1> {msg->React.string} </h1>
  
  The Message Module have two things inside, the make that is your react component and makeProps
  the ppx react.component generated this for us, the make and the makeProps
  if you remove the line @react.component, the type inference will tell that Message Module
  is just an module that have some function make that return an react element, but you will not see anymore the makeProps function

  we needed this @react.component because this generated the code that the react will understand, like, in react, the props is an object
  here in rescript, we don't use records/objects for props for some reasons, one is because we have to type every field on that record
  so passing labed props, we guarantee type inference, it's so good.

  for test purpose, wou can render an react component in this way:
  let make = () => <div>{React.createElement(Message.make, Message.makeProps(~msg="Hello Worldd", ()))}</div>
  //or
  let make = () => <div> {React.createElement(Message.make, {"msg": "Hello Worldd"})} </div>

  The MakeProps there will return an object, as you can see, using the function or passing in the hand, will result in the same.

}
*/

module Message = {
  @react.component
  let make = (~msg) => <h1> {msg->React.string} </h1>
}

@react.component
let make = () =>
  <div>
    <Message msg="DSAHDUISA" />
  </div>
