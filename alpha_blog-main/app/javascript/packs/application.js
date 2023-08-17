// Support component names relative to this directory:
console.log("Hello Rishabh");
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
