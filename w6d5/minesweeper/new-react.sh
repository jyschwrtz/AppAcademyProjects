INPUTFILE=${1:-my_app}
OUTPUTFILE=${2:-bundle}

echo "Initializing npm with the following components:"
echo "webpack react react-dom babel-core babel-loader babel-preset-es2015 babel-preset-react..."
npm init --yes
npm install --save webpack react react-dom babel-core babel-loader babel-preset-es2015 babel-preset-react

echo "Creating .gitignore..."
printf "# .gitignore

node_modules/
bundle.js
bundle.js.map
" > ./.gitignore

echo "Making a subdirectory: 'frontend'..."
mkdir frontend

printf "Creating a webpack.config.js with input file: "
printf $INPUTFILE
printf " and output file: "
printf $OUTPUTFILE
printf "...\n"

printf "// webpack.config.js
var path = require('path');

module.exports = {
  entry: \"./frontend/"$INPUTFILE".jsx\",
  output: {
      path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
      filename: \""$OUTPUTFILE".js\"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
" > webpack.config.js

echo "Creating input file..."
printf "import React from 'react';
import ReactDOM from 'react-dom';

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<h1>React is working!</h1>, document.getElementById('root'));
});
" > frontend/$INPUTFILE.jsx

echo "Creating a shell index.html file..."
printf "<!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
    <title></title>
    <script type=\"text/javascript\" src=\"app/assets/javascripts/"$OUTPUTFILE".js\"></script>
    <link rel=\"stylesheet\" href=\"css/reset.css\">
    <link rel=\"stylesheet\" href=\"css/main_styles.css\">
  </head>
  <body>
    <div id=\"root\">
      If you're reading this, React ain't working.
    </div>
  </body>
</html>" > index.html

echo "Creating a CSS subdirectory..."
mkdir css

echo "Creating a main_styles.css file..."
touch css/main_styles.css

echo "Creating a CSS Reset file..."
printf "/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}" > css/reset.css

echo
echo "Please paste the following into the 'scripts' hash in package.json:"
echo "\"webpack\": \"webpack\""
gedit package.json
