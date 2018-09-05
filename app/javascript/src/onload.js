import hljsInit from './highlight'
import cleanBlog from './clean-blog'
import contactMe from './contact_me'

$(document).on('ready turbolinks:load', function() {
  hljsInit();
  cleanBlog();
  contactMe();
});
