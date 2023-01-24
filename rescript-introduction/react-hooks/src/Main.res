
let root = ReactDOM.querySelector("#root")

switch root {
| Some(element) => ReactDOM.render(<App />, element)
| None => Js.log("Encontro nada fião")
}
