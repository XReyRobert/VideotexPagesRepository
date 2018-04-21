const puppeteer = require('puppeteer');

// print process.argv
process.argv.forEach(function (val, index, array) {
});

function delay(timeout) {
  return new Promise((resolve) => {
    setTimeout(resolve, timeout);
  });
}

url = process.argv[2];
filename = process.argv[3];

console.log("Generating thumbnail "+filename);
console.log("Using url "+url);

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('http://www.lideal.com/miedit/minitel-loader-fast.html?url='+url);
  //#await page.waitFor(1000);
  await page.screenshot({path: filename});

  await browser.close();
})();
