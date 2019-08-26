import React from "react"
import { Link } from "gatsby"

import Layout from "../components/layout"
import Image from "../components/image"
import SEO from "../components/seo"
import logo from './../images/logo.png';
import { Select } from "@blueprintjs/select";
import { Button, MenuItem } from '@blueprintjs/core';
import "@blueprintjs/core/lib/css/blueprint.css";

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <h1 style={{
      color: `Gray`,
      paddingTop: `20px`,
      fontSize: `2em`,
      }}><strong>Population Trends </strong> of Birds in Taiwan</h1>
    <h4 style={{
      color: `Gray`,
      padding: `0px`
    }}>A example of time series dashboard</h4>
    <hr width="36%"></hr>
    <p style={{
      fontFamily: `sans-serif`,
      color: `Gray`,
      fontWeight: `bold`,
      fontSize: `18px`,
    }}> Select Species: </p>
    <Select
      items={["Passer montanus 麻雀", "Hypsipetes leucocephalus 紅嘴黑鵯"]}
      onItemSelect={e => console.log(e)}
      itemRenderer={(query, active, handleClick) => <MenuItem text={query} key={query} active={active} onClick={handleClick}/>}
      style={{ fontStyle: `oblique` }}
     > 
      <Button text="herehere" rightIcon="double-caret-vertical" />
    </Select>
  </Layout>
)

export default IndexPage
