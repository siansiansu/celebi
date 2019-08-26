import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
import { Navbar, Button, Alignment } from '@blueprintjs/core';
import "@blueprintjs/core/lib/css/blueprint.css";
import logo from './../images/logo.png';

const Header = ({ siteTitle }) => (
<Navbar>
    <Navbar.Group >
      <img src={logo} width="40" height="40" style={{
        margin: 0,
      }} />
      <Navbar.Divider />
      <h1 style={{ margin: 1 }}>
        <Link
          to="/"
          style={{
            color: `Gray`,
            textDecoration: `none`,
            textAlign: `center`,
            fontWeight: `normal`,
            fontSize: `34px`,
            margin: 0,
          }}
        >
          {siteTitle}
        </Link>
      </h1>
    </Navbar.Group>

    <Navbar.Group align={Alignment.RIGHT}>
      <Button className="bp3-minimal" icon="info-sign" text="About" />
      <Button className="bp3-minimal" icon="envelope" text="Contact" />
      <Button className="bp3-minimal" icon="git-repo" text="Source" />
    </Navbar.Group>
  </Navbar>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
