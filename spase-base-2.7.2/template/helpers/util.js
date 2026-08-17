// Convert an object into an array

function array(obj,name) {

   if(! obj) { console.log("array():Object is not defined."); return[]; }
   if(! obj[name]) { console.log("array(): Element with name '"+name+"' is not defined.");return[]; }
   return obj[name];

}

// Group elements of an array by common element value.

function group(obj,name) {

   if(! obj) { console.log("group(): Object is not defined."); return []; }
   var results = [];
   var set = { title:"",entry:[]};

   for (let i=0;i<obj.length;i++) {

      var item = obj[i];

      if(item[name] != set.title) {

         if(set.title.length > 0) results.push(set);
         set = new Object();
         set.title = item[name];
         set.entry = [];

      }

      set.entry.push(item);
   }

   if(set.title.length > 0) results.push(set);

   return results;
}

// Build a tree of nested arrays

function buildTreeArray(ont,name,occurrence) {

   var item = { name:name,occurrence:occurrence,children:[] };

   if(occurrence == null) { // Root of tree
      item.occurrence = "1";

   }

   if(ont[name]) { // Build up children

      var list = ont[name];
      var keys = Object.keys(list);

      if(keys.length > 0) {

         for (var i = 0; i < keys.length; i++) {

            var key = keys[i];
            item.children.push( buildTreeArray(ont,key,list[key].occurrence) );

         }

      }

   }

   if(occurrence == null) { // Root of tree
      return [item];
   }

   return item; // part of tree

}

// Build a tree of nested arrays

function buildTree(ont,name,occurrence,prefix) {

   var set = [];
   set.push( { prefix:prefix,name:name,occurrence:occurrence } );

   if(ont[name]) { // Build up children

      var list = ont[name];
      var keys = Object.keys(list);

      if(keys.length > 0) {

         for (var i = 0; i < keys.length; i++) {

            var key = keys[i];
            set.push( ...buildTree(ont,key,list[key].occurrence,"|        "+prefix) );

         }

      }

   }

   return set;

}

function now() {

   var today=new Date();
   var dd=String(today.getDate()).padStart(2,'0');
   var mm=String(today.getMonth()+1).padStart(2,'0'); //January is 0!
   var yyyy=today.getFullYear();

   today=yyyy+'-'+mm+'-'+dd;

   return(today);

}

function dump(obj) {

   console.log("***");
   console.log(JSON.stringify(obj,null,3));
   console.log("***");

}
