/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validar(){
    var txtorigen,txtdestino;
    txtorigen=document.getElementById("txtorigen").value;
    txtdestino=document.getElementByID("txtdestino").value;
    
    if (txtorigen===""){
        
       alert("el campo esta vacio");
       return false;
    }else if(txtdestino===""){
        
        alert("el campo esta vacio")
        return false;
    }
    
}

