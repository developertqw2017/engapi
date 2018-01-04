function action_to(page){
    var xmlhttp1 = new XMLHttpRequest();

    xmlhttp1.onreadystatechange=function()
    {
        if(xmlhttp1.readyState == 4 || xmlhttp1.readyState == "complete"){
            document.getElementById("index_page").innerHTML=xmlhttp1.responseText;
            var regDetectJs = /<script(.|\n)*?>(.|\n|\r\n)*?<\/script>/ig;
            var jsContained = xmlhttp1.responseText.match(regDetectJs);
            console.log(jsContained);
            if(jsContained) {
                var regGetJS = /<script(.|\n)*?>((.|\n|\r\n)*)?<\/script>/im;
                var jsNums = jsContained.length;
                for (var i=0; i<jsNums; i++) {
                    var jsSection = jsContained[i].match(regGetJS);

                    if(jsSection[2]) {
                        if(window.execScript) {
                            window.execScript(jsSection[2]);


                        } else {
                            window.eval(jsSection[2]);


                        }


                    }


                }


            }


        }

    }
    xmlhttp1.open("POST",page,true);
    xmlhttp1.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp1.send();
}
function index_action_to(){
    action_to("./index.php")

};
function reports_action_to(){
    action_to("./reports.php");

};
function guidely_action_to(){
    action_to("./guidely.php");

};
function chart_action_to(){
    action_to("./charts.php");

};
function shortcodes_action_to(){
    action_to("./shortcodes.php");

};
function pricing_action_to(){
    action_to("./pricing.php");

}
function faq_action_to()
{
    action_to("./faq.php");

}
function error_action_to()
{
    action_to("./error.php");

}
function icons_action_to()
{
    action_to("./icons.php");

}
function login_action_to()
{
    action_to("./login.php");

}
function signup_action_to()
{
    action_to("./signup.php");

}
