// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

import React from "react"
import ReactDOM from "react-dom"
import CssBaseline from "@material-ui/core/CssBaseline"
import TopBar from "./components/TopBar"

class PromissoriasApp extends React.Component {
  render() {
    return (
      <React.Fragment>
        <CssBaseline />
        <TopBar />
      </React.Fragment>
    )
  }
}

ReactDOM.render(
  <PromissoriasApp />,
  document.getElementById("promissorias-app")
)

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
