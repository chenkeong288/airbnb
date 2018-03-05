$(document).ready(function () {
 
var city_input = document.getElementById("user_search_input")                                                         // put id="user_search_input" into the search text_field, and the user's input in the text_field will be saved into a variable

if (city_input){                                                                                                     // This code means when if there is user input, the function 'autocomplete(event)' will be executed  (on keyup, means user has typed and relesase keyboard)
  city_input.addEventListener("keyup", function(event){
    console.log("hi");
    autocomplete(event);
  })
}

window.globalXHR = new XMLHttpRequest()                                                                              // This is the helper which help to update the display without refreshing the page

function autocomplete(event) {                                                                                       // When the autocomplete(event) function executes (meaning when user key-in input making input.value.length > min_char), the helper will abort and stop all current action via code in line 27. The helper then executes function onreadystatechange function in line 32                                 
  //retrieve input
  var input = event.target

  //get datalist element for results
  var list = document.getElementById("list")                                                                          //This refers to the dropdown list.
                                                                                                                      //Need to put <datalist> tag with id="list" below the search bar for dropdown list
  //set minimum num of chars
  var min_chars = 0

  if (input.value.length > min_chars) {
    //abort pending requests
    //ensure that our XHR object is not working on any pending request before we tell it to do new work
    window.globalXHR.abort()

    // Callback to be applied once the XMLHttpRequest() internal state has been changed after
    // sending a request
    // We check to see whether the request is done and that the return status of the request is ok
    window.globalXHR.onreadystatechange = function(){                                                               //onreadystatechange will update all the information based on the latest user input without refreshing                                                            
      if (this.readyState == 4 && this.status == 200) {

        //convert json response to an object
        var response = JSON.parse(this.responseText)

        //clear previous results
        list.innerHTML = ""

        response.forEach(function(element){
          //create new option element
          var option = document.createElement("option")
          option.value = element

          //append option to list
          list.appendChild(option)
        })
      }
    }

    // authentication is required whenever our client wishes to make a request to our server
    // this is to prevent csrf attacks on our servers
    // more info can be found at the link below
    // https://www.checkmarx.com/2016/01/22/ultimate-guide-understanding-preventing-csrf/
    var auth_token = document.querySelector("[name='csrf-token']").content                                          //These remaining 4 lines of codes are functioning to get user input in the database. It will execute method autocomplete in controller based on the rails route url, which direct it to the method autocomplete in controller file. The Ruby logic in controller will go into the database to get list related to the user input
    window.globalXHR.open("POST", "listings/autocomplete?user_search_input=" + input.value, true)                   // "listings/autocomplete?user_search_input="  -----> listing/autocomplete? is the url which direct to the method autocomplete in controller... user_search_input connect to the id="user_search_input" in the text field... The helper carries the user input value to the method search in controller file
    //allow js to make request to rails server
    window.globalXHR.setRequestHeader("X-CSRF-TOKEN", auth_token)
    window.globalXHR.send()
  }
}
 //your code here
});






