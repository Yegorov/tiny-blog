//import 'highlight.js/styles/monokai'
import 'highlight.js/styles/xcode'
import hljs from 'highlight.js/lib/highlight'
import javascript from 'highlight.js/lib/languages/javascript'

export default function() {
  hljs.registerLanguage('javascript', javascript);
  //hljs.initHighlighting.called = false;
  //hljs.initHighlighting();
  $('pre code').each(function(i, e) { hljs.highlightBlock(e)} );
}
