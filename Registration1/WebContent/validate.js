var x=document.getElementById("form");
x.addEventListener("blur",myBlur1,true);
x.addEventListener("focus",myFocus1,true);

var y=document.getElementById("form");
y.addEventListener("blur",myBlur2,true);
y.addEventListener("focus",myFocus2,true);

var z=document.getElementById("form");
z.addEventListener("blur",myBlur3,true);
z.addEventListener("focus",myFocus3,true);

var a=document.getElementById("form");
a.addEventListener("blur",myBlur4,true);
a.addEventListener("focus",myFocus4,true);

var b=document.getElementById("form");
b.addEventListener("blur",myBlur5,true);
b.addEventListener("focus",myFocus5,true);

var c=document.getElementById("form");
c.addEventListener("blur",myBlur6,true);
c.addEventListener("focus",myFocus6,true);

function myBlur1(){
	var name=document.getElementById("name");
	if(name.value==""||name.value==null){
		document.getElementById("name").style.backgroundColor="red";
	document.getElementById("lbName").style.visibility="visible";

	}else{
		myFocus1();
	}
	
}

function myFocus1(){
	document.getElementById("name").style.backgroundColor="";
	document.getElementById("lbName").style.visibility="hidden";
}

function myBlur2(){
	var age=document.getElementById("age");
	if(age.value==""||age.value==null){
	document.getElementById("age").style.backgroundColor="yellow";
	document.getElementById("lbAge").style.visibility="visible";
	}
	else{
		myFocus2();
	}
}

function myFocus2(){
	document.getElementById("age").style.backgroundColor="";
	document.getElementById("lbAge").style.visibility="hidden";
}

function myBlur3(){
	var mob=document.getElementById("mobile");
	if(mob.value==""||mob.value==null){
	document.getElementById("mobile").style.backgroundColor="blue";
	document.getElementById("lbMobile").style.visibility="visible";
	}
	else if(isNaN(mob.value)){
		document.getElementById("lbMobile").style.visibility="visible";	
	}
	else if(mob.value.length<1 || mob.value.length>10){
		document.getElementById("lbMobile").style.visibility="visible";
	}
	else{
		myFocus3();
	}
}

function myFocus3(){
	document.getElementById("mobile").style.backgroundColor="";
	document.getElementById("lbMobile").style.visibility="hidden";
}

function myBlur4(){
	var mail=document.getElementById("email");
	var reg = /^([A-Z a-z 0-9]+)@([A-Z a-z 0-9]+).([A-Z a-z]{2,4})$/;

	if(reg.test(mail.value)){
	document.getElementById("email").style.backgroundColor="";
	document.getElementById("lbEmail").style.visibility="hidden";
	}

else{
	myFocus4();
	}
}
function myFocus4(){
	document.getElementById("email").style.backgroundColor="lightblue";
	document.getElementById("lbEmail").style.visibility="visible";
}

function myBlur5(){
	var addr=document.getElementById("address");
	if(addr.value=="" || addr.value==null){
	document.getElementById("address").style.backgroundColor="green";
	//document.getElementById("lbMobile").style.visibility="visible";
	}
	else{
		myFocus5();
	}
}

function myFocus5(){
	document.getElementById("address").style.backgroundColor="";
}

function myBlur6(){
	var pwd=document.getElementById("password");
	if(pwd.value==""||pwd.value==null){
	document.getElementById("password").style.backgroundColor="grey";
	//document.getElementById("lbMobile").style.visibility="visible";
	}
	else{
		myFocus6();
	}
}

function myFocus6(){
	document.getElementById("password").style.backgroundColor="";
}

