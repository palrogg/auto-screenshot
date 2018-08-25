// automatic screenshot snipped - Paul

var page = require('webpage').create();
var url = 'https://SOME-URL';

// Depending on your project, you'll need to set a timezone here
var now = (new Date()).toISOString().substring(0, 16).replace(':', 'h').replace('T', '_');

// custom viewport - change as needed
page.viewportSize = {
  width: 1800,
  height: 1200
};

page.open(url, function() {
  page.render('/root/auto-screenshot/screenshots/' + now + '.png');
  phantom.exit();
});
