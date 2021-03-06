#!/bin/bash
echo "browserify ./src/index.js -o ./dist/bundle.js"
npx browserify .\src\index.js -o .\dist\bundle.js
echo " = = = = = Browserify done = = = = = = "
echo "prepend greasyfork head "
sed -i.old '1s;^;\// ==UserScript==\
  // @name                la-image-extractor\
  // @name:zh-CN          la 图片地址复制\
  // @description         copy image source in hitomi.la & notomi.la & e-hentai.org to clipboard\
  // @description:zh-CN   复制 hitoma.la & notomi.la & e-hentai 图片链接到剪贴板\
  // @version             0.2.5\
  // @author              jferroal\
  // @license             GPL-3.0\
  // @require             https://greasyfork.org/scripts/31793-jmul/code/JMUL.js?version=209567\
  // @include             https://hitomi.la/reader/*\
  // @include             https://nozomi.la/tag/*\
  // @include             https://e-hentai.org/s/*\
  // @grant               GM_xmlhttpRequest\
  // @run-at              document-idle\
  // @namespace           https://greasyfork.org/users/34556-jferroal\
  // ==/UserScript==\n\n;' .\dist\bundle.js
echo " = = = = = prepend bundle with greasyfork head done = = = = = "
rm .\dist\bundle.js.old
cp .\dist\bundle.js .\export\la-image-extractor.user.js
