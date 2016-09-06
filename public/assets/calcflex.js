flex = function(){
   var valc = parseFloat(document.getElementById('alcool').value);
   var vgas = parseFloat(document.getElementById('gasolina').value);
   
   if ((valc / vgas) < 0.7) {
	  toastr["success"]('Recomendamos o uso de Alcool!', "Karango WepApp");
   }else{
      toastr["success"]('Recomendamos o uso de Gasolina!', "Karango WepApp");
   };
};