/**
 * Created by sumitshrestha on 7/21/15.
 */
$(document).ready(function(){
   var form = $("#userform");
   var password = $("#password");
   var userName = $("#userName");
   var role = $("#role");
   var userDetail= $("#userInfo");
    form.submit(function(){
         if(validateUserName()){
             return true;
         }else{
            return false;
         }
    });

    function validateUserName(){
        if(userName.val().length < 5){
            userName.addClass("span");
            userDetail.text("Your userName is to short");
            return false;
        }else{
            userName.removeClass("error");
            return true;
        }
    }


});