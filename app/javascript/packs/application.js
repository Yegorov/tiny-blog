/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import Turbolinks from 'turbolinks'
import Rails from 'rails-ujs'

Rails.start()
window.Turbolinks = Turbolinks
Turbolinks.start()

//import 'highlight.js/styles/monokai'
import 'highlight.js/styles/xcode'
import hljs from 'highlight.js/lib/highlight';
import javascript from 'highlight.js/lib/languages/javascript';
hljs.registerLanguage('javascript', javascript);
hljs.initHighlightingOnLoad()

import "bootstrap"
import 'bootstrap/dist/css/bootstrap'
import "font-awesome/css/font-awesome"


import "../src/clean-blog"

import "../src/application.css"
import "../src/images"

