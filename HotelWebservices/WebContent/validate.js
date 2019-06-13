	function countryList(){
	
		var cntr=document.getElementById("country").value;
		//alert(cntr);
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		  xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
			var sdf =xmlhttp.responseText;
			document.getElementById("city").innerHTML=xmlhttp.responseText;
				
			}
		  }
		  xmlhttp.open("GET","search2.jsp?code="+cntr+"",true);
		
		xmlhttp.send();
	}
	