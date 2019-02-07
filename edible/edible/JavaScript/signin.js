function check_error(error, input){
    if(document.getElementById(input).value == ""){
      document.getElementById(error).textContent = "Field cannot be empty";
    }else{
      document.getElementById(error).textContent = "";
    }}