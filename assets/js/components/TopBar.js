import React from "react"
import PropTypes from "prop-types"
import { withStyles } from "@material-ui/core/styles"
import {
  AppBar,
  Toolbar,
  Button,
  Icon,
  IconButton,
  Typography
} from "@material-ui/core"
import MenuIcon from "@material-ui/icons/Menu"
import UserMenuTopBar from "./UserMenuTopBar"

const styles = theme => ({
  root: {
    flexGrow: 1
  },
  flex: {
    flex: 1
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20
  },
  button: {
    margin: theme.spacing.unit
  }
})

function TopBar(props) {
  const { classes } = props

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
          <IconButton
            className={classes.menuButton}
            color="inherit"
            aria-label="Menu"
          >
            <MenuIcon />
          </IconButton>
          <Typography variant="title" color="inherit">
            Promissórias
          </Typography>
          <Button color="inherit" className={classes.button}>
            <Icon>add</Icon>
            Nova Promissória
          </Button>
          <Button color="inherit" className={classes.button}>
            <Icon>attach_money</Icon>
            Receber Pagamento
          </Button>
          <div className={classes.flex} />
          <UserMenuTopBar />
        </Toolbar>
      </AppBar>
    </div>
  )
}

TopBar.propTypes = {
  classes: PropTypes.object.isRequired
}

export default withStyles(styles)(TopBar)
