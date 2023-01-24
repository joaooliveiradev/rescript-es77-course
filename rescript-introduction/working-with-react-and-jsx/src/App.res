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

//Component with props
module Message = {
  @react.component
  let make = (~msg) => <h1> {msg->React.string} </h1>
}

//Component with optional props
module MessageOptional = {
  @react.component
  let make = (~id=?, ~message=?) => {
    // if you want to pass an optional props to an attribute prop or something that accepts only string or any other type that isin't option
    // you need to pass ? before the keyword like in this example
    switch message {
    | Some(msg) => <h1 ?id> {msg->React.string} </h1>
    | None => React.null
    }
  }
}

module MessageDefaultValue = {
  @react.component
  let make = (~message="Default Value") => {
    <h1> {message->React.string} </h1>
  }
}

module ComponentWithChildren = {
  @react.component
  let make = (~children) => {
    <h1> children </h1>
  }
}

module MessageIsLoading = {
  @react.component
  let make = (~isLoading) => {
    <h1> {(isLoading ? "Loading..." : "Loaded!")->React.string} </h1>
  }
}

module MessageArrayComponent = {
  let items = ["Hello", "World", "Foo", "Bar"]
  let elements = Belt.Array.mapWithIndex(items, (key, item) =>
    <h1 key={key->Js.Int.toString}> {item->React.string} </h1>
  )

  @react.component
  let make = () => {
    <div> {elements->React.array} </div>
  }
}

module MessageWithRenderMap = {
  let names = ["Jao", "Mendras", "Marcolino", "Fdachoque"]
  open Render
  @react.component
  let make = () => Render.map(names, (item, key) => <h1 key={key}>{item}</h1>)
}

@react.component
let make = () => <>
  <Message msg="foo" />
  <MessageOptional message="Test" id="idTest" />
  <MessageDefaultValue />
  <ComponentWithChildren> {"Hello from children"->React.string} </ComponentWithChildren>
  <MessageIsLoading isLoading=true />
  <MessageArrayComponent />
  <MessageWithRenderMap />
</>
