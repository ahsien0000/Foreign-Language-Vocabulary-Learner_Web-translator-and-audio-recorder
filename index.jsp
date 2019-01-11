<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    Please enter the vocabulary :<BR>
  
  <TEXTAREA id="org" cols="40" rows="10"></TEXTAREA>	<button type="button" onclick="displayelement()" >Enter<BR></button>
  <BR>  
  

  
    <div id="google_translate_element" ></div>
	
	<script src="js/audiodisplay.js"></script>
	<script src="js/recorderjs/recorder.js"></script>
	<script src="js/main.js"></script>
	
	<script type="text/javascript">
	var entext, trstext, mix = [], arr_en = [], array_trs = [];
	
	
	function sayit(){
	var inputText = document.getElementById("org");
	var msg = new SpeechSynthesisUtterance();
	var voices = window.speechSynthesis.getVoices();
    msg.text = arr_en[0].value;
    msg.lang = 'en';//en,zh
    speechSynthesis.speak(msg);
   }
   
	function sayit3(){
	var inputText = document.getElementById("org");
	
   
	var msg = new SpeechSynthesisUtterance(inputText.value);
    msg.voice = speechSynthesis.getVoices().filter(function(voice) { return voice.name == 'Google US English '; })[0];
    speechSynthesis.speak(msg);
	

	}

	var ele0= [];
	var results = "";
	
	function googleTranslateElementInit() {
	new google.translate.TranslateElement({
    pageLanguage: 'en'
	}, 'google_translate_element');
}
	function getid()
	{
	
	ele0=document.getElementsById('org');
	}
	
	function displayelement()
	{

		 var text = document.getElementById("org");
		 var showarea = document.getElementById("adduserdata");
		 showarea.innerHTML=text.value;
		

	 
	}
	
	function merge()
	{
	
		 var entext = document.getElementById("org");
		 var trstext = document.getElementById("adduserdata");
		 var showarea = document.getElementById("mergedata");

		 
		 childWindow = window.open('','childWindow','location=yes, menubar=yes, toolbar=yes');
		 childWindow.document.open();
		 childWindow.document.write('<html><head></head><body>');
		 childWindow.document.write(entext.value + '<BR>' + trstext.innerHTML);
		 childWindow.document.write('</body></html>');
		 
	}

	function intersect()
	{
		 entext = document.getElementById("org").value + '';
		 trstext = document.getElementById("adduserdata").innerText + '';
		 //var mix = [];
		 
		 var separators = [',', '，'];
		 arr_en = entext.split(new RegExp(separators.join('|')));
		 array_trs = trstext.split(new RegExp(separators.join('|')));
		 for (var i = 0; i < arr_en.length; i++) 
		 {
		 if(arr_en[i].value!="")
		 {
			//mix[2*i] = arr_en[i];
			//mix[2*i+1] = array_trs[i];
			mix[2*i] = array_trs[i];
			mix[2*i+1] = arr_en[i];
		 }
		 }
		 
		 childWindow = window.open('','childWindow','location=yes, menubar=yes, toolbar=yes');
		 childWindow.document.open();
		 childWindow.document.write('<html><head></head><body>');
		 childWindow.document.write(mix);
		 childWindow.document.write('</body></html>');
		 
		 
		 for(var i=0; i<mix.length;i++)
		 {
		 
			var msg = new SpeechSynthesisUtterance();
		    var voices = window.speechSynthesis.getVoices();
			msg.text = mix[i];
			 if(i % 2 == 1) // ==0
			 {
			   msg.lang = 'en';//en,zh
			   speechSynthesis.speak(msg);
			 }
			 else if (i % 2 == 0)// ==1
			 {
			   msg.lang = 'zh';//en,zh
			   speechSynthesis.speak(msg);
			 }
			
		 }
		 
	}
</script><script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	
    
    
	
  </head>
  <body>


	<div id="adduserdata"; style="width:350px"></div>
	<BR>
	<BR>

	<!--<button type="button" onclick="merge()" >Merge Window</button>
	<div id="mergedata"; style="width:350px"></div>	 -->
	
	<button type="button" onclick="intersect()" ><BR>Window<BR><BR></button>
  	<div id="result"; style="width:350px"></div>	

	
	<!--<button type="button" onclick="sayit()" ><BR>Pronounce<BR><BR></button> -->

  
<!--  Please enter the vocabulary :<BR>
  

<TEXTAREA id="org" cols="40" rows="10"></TEXTAREA><BR>

Select the language: 

	<SELECT id="sltLng">

		<OPTION value="en">English</OPTION>

		<OPTION value="zh-TW">Chinese(tranditional)</OPTION>

		<OPTION value="zh-CN">Chinese(simplified)</OPTION>

		<OPTION value="ja">Japanese</OPTION>

		<OPTION value="ko">Korean</OPTION>

		<OPTION value="th">Thai</OPTION>

		<OPTION value="de">German</OPTION>

		<OPTION value="fr">French</OPTION>

	</SELECT>

<INPUT id="btnTrn" value="Translate" type="button">

<HR>

Result:<BR>

<TEXTAREA id="trn" cols="40" rows="10"></TEXTAREA><BR>

<INPUT id="btnSayIt" value="Pronounciation" type="button"><BR>

<DIV id="divSayIt"></DIV>

-->
  
  </body>
  
  <style>

	
	body2 { 
		font: 14pt Arial, sans-serif; 
		background: white;
		display: flex;
		flex-direction: row;
		height: 100vh;
		width: 100%;
		margin: 0 0;
	}
	canvas { 
		display: inline-block; 
		background: #202020; 
		width: 90%;
		height: 40%;
		box-shadow: 0px 0px 10px blue;
	}
	#controls {
		display: flex;
		flex-direction: cloumn;
		align-items: center;
		justify-content: space-around;
		height: 20%;
		width: 50%;
	}
	#record { height: 13vh; }
	#record.recording { 
		background: red;
		background: -webkit-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: -moz-radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
		background: radial-gradient(center, ellipse cover, #ff0000 0%,lightgrey 75%,lightgrey 100%,#7db9e8 100%); 
	}
	#save, #save img { height: 10vh; }
	#save { opacity: 0.25;}
	#save[download] { opacity: 1;}
	#viz {
		height: 80%;
		width: 100%;
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
	}
	@media (orientation: landscape) {
		body { flex-direction: row;}
		#controls { flex-direction: column; height: 100%; width: 10%;}
		#viz { height: 100%; width: 90%;}
	}

	</style>
  
  <body2>
  <div id="controls">
		<img id="record" src="img/mic128.png" onclick="toggleRecording(this);">
		<a id="save" href="#"><img src="img/save.svg"></a>
	</div>
  <div id="viz">
		<canvas id="analyser" width="300" height="250"></canvas>
		<canvas id="wavedisplay" width="300" height="250"></canvas>
	</div>
	
  </body2>
</html>
