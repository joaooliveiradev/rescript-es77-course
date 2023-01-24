module HookUseState = {
  @react.component
  let make = () => {
    let (counter, setCounter) = React.useState(() => 0)
    let onHandleClick = _ => setCounter(prevCounter => prevCounter + 1)

    <button onClick=onHandleClick>
      {`Counter ${counter->Belt.Int.toString} Use State`->React.string}
    </button>
  }
}

module HookUseReducer = {
  type action = Inc | Dec

  @react.component
  let make = () => {
    let reducer = (state, action) => {
      switch action {
      | Inc => state + 1
      | Dec => state - 1
      }
    }

    let (state, dispatch) = React.useReducer(reducer, 0)

    <div>
      <button onClick={_ => dispatch(Inc)}> {"Incrementar"->Render.s} </button>
      <button onClick={_ => dispatch(Dec)}> {"Decrementar"->Render.s} </button>
      <div> {`Counter using useReducer ${state->Belt.Int.toString}`->Render.s} </div>
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
  </div>
}
