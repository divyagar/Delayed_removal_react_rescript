// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Post from "./post.bs.js";
import * as React from "react";
import * as Button from "./Button.bs.js";
import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";

function s(prim) {
  return prim;
}

function OriginalBlock(Props) {
  var post = Props.post;
  var deleteHandle = Props.deleteHandle;
  var text = Post.text(post);
  return React.createElement("div", {
              className: "bg-green-700 hover:bg-green-900 text-gray-300 hover:text-gray-100 px-8 py-4 mb-4",
              id: "block"
            }, React.createElement("h2", {
                  className: "text-2xl mb-1"
                }, Post.title(post)), React.createElement("h3", {
                  className: "mb-4"
                }, Post.author(post)), Belt_Array.mapWithIndex(text, (function (idx, t) {
                    return React.createElement("p", {
                                key: Post.id(post) + String(idx),
                                className: "mb-1 text-sm"
                              }, t);
                  })), React.createElement(Button.make, {
                  text: "Remove",
                  className: "mr-4 mt-4 bg-red-500 hover:bg-red-900 text-white py-2 px-4",
                  handleClick: deleteHandle
                }));
}

var make = OriginalBlock;

export {
  s ,
  make ,
  
}
/* Post Not a pure module */
