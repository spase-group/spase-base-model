const fs = require('fs');
const path = require('path');
const jsreport = require('jsreport-proxy');
const loader = require('loader.js');

function beforeRender (req, res) {
    // req.data = req.data || {}
	console.log("Before render");
}

async function afterRender(req, res) {
	const toc = loader.loadFile(req.data.options.toc, "utf8");
	const coverPage = loader.loadFile(req.data.options.cover, "utf8");
	const helpers = loader.loadAll(req.data.options.helpers, ".js"); 
	/*
	const toc = loader.loadFile(path.join(req.data.options.base, req.data.options.toc), "utf8");
	const coverPage = loader.loadFile(path.join(req.data.options.base, req.data.options.cover), "utf8");
	const helpers = loader.loadAll(path.join(req.data.options.base, req.data.options.helpers), ".js"); 
	*/
	
	console.log("afterRender(): initialize");
	
    // after rendering with some pdf recipe we can use .parse to read the text in the pdf
    let $pdf = await jsreport.pdfUtils.parse(res.content, true)

    // Add a table of contents (if requested)
	if(toc.length > 0) {
		console.log("Adding table of contents ...");
		if ($pdf.pages[0] && $pdf.pages[0].text != null) {
			const appendRes = await jsreport.render({
				template: {
					content: toc,
					engine: 'handlebars',
					recipe: 'chrome-pdf',
					helpers: helpers,
				},
				data: {
					...req.data,
					$pdf
				}
			});

			res.content = await jsreport.pdfUtils.prepend(res.content, appendRes.content);
		}
	}

	if(coverPage.length > 0) {
		console.log("Adding cover page...");
		if ($pdf.pages[0] && $pdf.pages[0].text != null) {
			const coverRender = await jsreport.render({
				template: {
					content: coverPage,
					engine: 'handlebars',
					recipe: 'chrome-pdf',
					helpers: helpers
				},
				data: {
					...req.data,
					$pdf
				}
			});

			// finally add a cover page
			res.content = await jsreport.pdfUtils.prepend(res.content, coverRender.content)
		}
	}
}