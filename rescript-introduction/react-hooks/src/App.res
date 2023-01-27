module HookUseState = {
  @react.component
  let make = () => {
    let (counter, setCounter) = React.useState(() => 0)
    let onHandleClick = _ => setCounter(prevCounter => prevCounter + 1)

    <div>
      <button onClick=onHandleClick> {`Incrementar + `->Render.s} </button>
      <p> {`Counter using UseState ${counter->Belt.Int.toString}`->Render.s} </p>
    </div>
  }
}

module HookUseReducer = {
  type action = Inc | Dec
  type state = int

  let reducer = (state, action) => {
    switch action {
    | Inc => state + 1
    | Dec => state - 1
    }
  }

  @react.component
  let make = () => {
    let (counter, dispatch) = React.useReducer(reducer, 0)

    <div>
      <button onClick={_ => dispatch(Inc)}> {"Incrementar"->Render.s} </button>
      <button onClick={_ => dispatch(Dec)}> {"Decrementar"->Render.s} </button>
      <p> {`Counter using useReducer ${counter->Belt.Int.toString}`->Render.s} </p>
    </div>
  }
}

module HookUseEffect = {
  @react.component
  let make = () => {
    let (_, setRandomNumber) = React.useState(_ => 0)

    React.useEffect(() => {
      Js.log("Hello useEffect in every re-render.")
      None
    })

    React.useEffect0(() => {
      Js.log("Hello useEffect just in the first render."->Render.s)
      None
    })

    let generateRandomNumber = () => {
      let number = Js.Math.random_int(1, 200)
      Js.log(`Generated number:  ${number->Belt.Int.toString}`)
      setRandomNumber(_ => number)
    }

    <div>
      <p> {"Check the console for the useEffect hook"->Render.s} </p>
      <button onClick={_ => generateRandomNumber()}>
        {`Click to see more logs on useEffects `->Render.s}
      </button>
    </div>
  }
}

@react.component
let make = () => {
  let wrapperStyles = ReactDOM.Style.make(
    ~display="flex",
    ~flexDirection="column",
    ~gridGap="20px",
    (),
  )
  <div style=wrapperStyles>
    <HookUseState />
    <HookUseReducer />
    <HookUseEffect />
  </div>
}
