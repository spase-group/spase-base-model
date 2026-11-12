function addClassOnPdfMerge(root,c) {
   if (root.$pdf) {
      return c
   }
   return ''
}

function level(chapters,parent,opts) {
   let res=''

   for (const ch of chapters) {
       res+=opts.fn({
       ...ch,
       parent
       })

       if (ch.chapters) {
          res+='<ul>'+Handlebars.helpers.level(ch.chapters,ch.id,opts)+'</ul>'
       }
   }

   return res
}

function getPage(root,id) {
   if (!root.$pdf) {
      // the main template
      return ''
   }

   for (let i=0;i<root.$pdf.pages.length;i++) {
       const item=root.$pdf.pages[i].items.find(item=>item.id===id)

       if (item) {
          return i+1
       }
   }
}
