<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function changeText(val){
                document.getElementById('status').innerHTML=val;
            }
            function doStuff(val){
                document.body.style.background=val;
            }
function CustomPrompt(){
	this.render = function(dialog,func,titl){
		var winW = window.innerWidth;
	    var winH = window.innerHeight;
		var dialogoverlay = document.getElementById('dialogoverlay');
	    var dialogbox = document.getElementById('dialogbox');
		dialogoverlay.style.display = "block";
	    dialogoverlay.style.height = winH+"px";
		dialogbox.style.left = (winW/2) - (550 * .5)+"px";
	    dialogbox.style.top = "100px";
	    dialogbox.style.display = "block";
		document.getElementById('dialogboxhead').innerHTML = titl;
	        document.getElementById('dialogboxbody').innerHTML = dialog;
		document.getElementById('dialogboxbody').innerHTML += "<br><input id='prompt_value1' value='"+func+"' style='width:450px;color:blue'>";
		document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Prompt.ok(\''+func+'\')">OK</button> <button onclick="Prompt.cancel()">Cancel</button>';
	}
	this.cancel = function(){
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
                return "0";
	}
	this.ok = function(func){
		var prompt_value1 = document.getElementById('prompt_value1').value;
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";
                alert(prompt_value1);
                return prompt_value1;
	}
}
var Prompt = new CustomPrompt();
        </script>
    </head>
    <body>
    <style>
 #dialogoverlay{
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	z-index: 10;
}
#dialogbox{
	display: none;
	position: fixed;
	border-radius: 7px;
	width: 550px;
	z-index: 10;
}
#dialogbox>div{background: #FFF;margin: 8px;}
#dialogbox>div>#dialogboxhead{background: #666;font-size: 19px;padding: 10px;
color: #CCC;}
#dialogbox>div>#dialogboxbody{background: #333;padding: 20px;
color: #FFF;}
#dialogbox>div>#dialogboxfoot{background: #666;padding: 10px;
text-align: right;}

       
    </style>    
        <div id="dialogoverlay"></div>
        <div id="dialogbox">
            <div>
                <div id="dialogboxhead"></div>
                <div id="dialogboxbody"></div>
                <div id="dialogboxfoot"></div>
            </div>
        </div>
        <script>

        </script>
        <h1 id="status"> Default Text</h1>
        <button  onclick="Prompt.render('Cause:','arpco','C.P.S')">Change Text</button>
        <button  onclick="Prompt.render('Type a color name:','doStuff')">Do stuff</button>
        </body>
</html>
