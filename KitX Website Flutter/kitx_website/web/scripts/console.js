﻿
const hello = () => {
    var style = "text-shadow: 0 1px 0 #ccc,0 2px 0 #c9c9c9,0 3px 0 #bbb,0 4px 0 #b9b9b9,0 5px 0 #aaa,0 6px 1px rgba(0,0,0,.1),0 0 5px rgba(0,0,0,.1),0 1px 3px rgba(0,0,0,.3),0 3px 5px rgba(0,0,0,.2),0 5px 10px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.2),0 20px 20px rgba(0,0,0,.15); font-size:5em";

    console.log("%cWelcome to", style);
    console.log("%cKitX Website", style);
}

const badge = (title, version, leftBackground = "#606060", rightBackground = "#42c02e") => {
    var padLeftStyle = ""
        + "padding: 2px 1px;"
        + "border-radius: 3px 0 0 3px;"
        + "color: #fff;"
        + "background: " + leftBackground + ";"
        + "font-weight: bold;";
    var padRightStyle = ""
        + "padding: 2px 1px;"
        + "border-radius: 0 3px 3px 0;"
        + "color: #fff;"
        + "background: " + rightBackground + ";"
        + "font-weight: bold;";

    console.log("%c " + title + " %c " + version + " ", padLeftStyle, padRightStyle);
}

badge("KitX Website", "v1.0.0");

hello();
