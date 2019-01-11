<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>Translate the Vocaulary</title>
    <SCRIPT type="text/javascript" src="http://www.google.com/jsapi"></SCRIPT>

	<SCRIPT type="text/javascript" src="jquery-3.1.1.min.js"></SCRIPT>


<SCRIPT type="text/javascript">

        google.load("language", "1");

$(document).ready(function () 

{

            $('#btnTrn').click(btnTrn_click);

            $('#btnSayIt').click(SayIt);

});




function googleTranslateElementInit() { 
	  new google.translate.TranslateElement({ 
	    pageLanguage: 'zh-TW', 
	    includedLanguages: 'en', 
	    multilanguagePage: true 
	  }); 
	} 

	 




function SayIt() {
		
		YOUR_API_KEY = AIzaSyC7pUZgVWe1OB0pPij42wgMdpMXdfvz38w;
		
		var lng = $('#sltLng').val();

		var Rlt = $('#trn').val();

		var strURL = 'http://translate.google.com/translate_tts?q=' + Rlt + '&tl=' + lng;//'https://translation.googleapis.com/language/translate/v2?key=AIzaSyC7pUZgVWe1OB0pPij42wgMdpMXdfvz38w&source=' + Rlt + '&target=' + lng + '&q=Hello%20world&q=My%20name%20is%20Jeff';

		var embed = '<embed src="' + strURL + '"/>';

		$('#divSayIt').html(embed);

}



function btnTrn_click() {

		var srcTxt = $('#org').val();

		var lng = $('#sltLng').val();

		google.language.detect(srcTxt, 

		function (result){

			if (!result.error && result.language) {

				google.language.translate(srcTxt, result.language, lng,

					function (result) {

						var trn = $('#trn');

						if (result.translation) {

							trn.val(result.translation);

						}

					}

				);

			}

		});

 	}

</SCRIPT>
<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 
	
  </head>
  <body>
  
  Please enter the vocabulary:<BR>

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


  
  </body>
</html>
