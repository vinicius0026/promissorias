import React from "react"
import { IconButton, Menu, MenuItem } from "@material-ui/core"
import { AccountCircle } from "@material-ui/icons"

class UserMenuTopBar extends React.Component {
  state = {
    anchorEl: null
  }

  handleMenu = event => {
    this.setState({ anchorEl: event.currentTarget })
  }

  handleClose = () => {
    this.setState({ anchorEl: null })
  }

  render() {
    const { anchorEl } = this.state
    const open = Boolean(anchorEl)

    return (
      <div>
        <IconButton
          aria-owns={open ? "user-menu-topbar" : null}
          aria-haspopup="true"
          onClick={this.handleMenu}
          color="inherit"
        >
          <AccountCircle />
        </IconButton>
        <Menu
          id="user-menu-topbar"
          anchorEl={anchorEl}
          anchorOrigin={{
            vertical: "top",
            horizontal: "right"
          }}
          transformOrigin={{
            vertical: "top",
            horizontal: "right"
          }}
          open={open}
          onClose={this.handleClose}
        >
          <MenuItem onClick={this.handleClose}>Sair</MenuItem>
        </Menu>
      </div>
    )
  }
}

export default UserMenuTopBar
