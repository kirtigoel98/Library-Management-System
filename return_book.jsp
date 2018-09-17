

<html>
<head>
<script>
var xmlhttp=null;
function search_acc()
{
  try
  {
   var accession_no=document.getElementById("accession_no").value;
      if( accession_no.length == 0)
	 return false;
	  
   var url="return_book?accession_no="+accession_no;
   xmlhttp=new XMLHttpRequest();
   xmlhttp.onreadystatechange = handleServerResponse;
   xmlhttp.open("GET",url,true);
   xmlhttp.send();
  }
  catch(e)
  {
   alert(e);
   console.log(e);
   return false;
  }
}

function handleServerResponse()
{
	try
	{
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				alert(xmlhttp.responseText);
				
				var xx,j=0;
				var temp;
				document.getElementById("issue_date").value="";
				document.getElementById("due_date").value="";
				document.getElementById("reader_id").value="";
				document.getElementById("trans_id").value="";
				document.getElementById("reader_name").value="";
				document.getElementById("reader_type").value="";
				document.getElementById("issued_by").value="";
			
				
				var x =  xmlhttp.responseXML.documentElement.getElementsByTagName("member");
				
				for(var i=0;i<x.length;i++)
				{
					xx=x[i].getElementsByTagName("issue_date");
					var issue_date=xx[0].firstChild.nodeValue;
						  
					xx=x[i].getElementsByTagName("due_date");
					var due_date=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("reader_id");
					var reader_id=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("trans_id");
					var trans_id=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("reader_name");
					var reader_name=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("reader_type");
					var reader_type=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("issued_by");
					var issued_by=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("remark");
					var remark=xx[0].firstChild.nodeValue;
					
					 xx=x[i].getElementsByTagName("status");
					var status=xx[0].firstChild.nodeValue;
						   if( Number(status)==2 )
						   {
						   		alert("This Book Already returned");
								return false;
						   }
					
				document.getElementById("issue_date").value=issue_date;
				document.getElementById("due_date").value=due_date;
				document.getElementById("reader_id").value=reader_id;
				document.getElementById("trans_id").value=trans_id;
				document.getElementById("reader_name").value=reader_name;
				document.getElementById("reader_type").value=reader_type;
				document.getElementById("issued_by").value=issued_by;
				document.getElementById("remark").value=remark;
				
				var today=new Date();
				var mm=today.getMonth()+1;
				var dd=today.getDate();
				if(mm<10){
					mm='0'+mm;
				}
				if(dd<10){
					dd='0'+dd;
				}
				document.getElementById("return_date").value=today.getFullYear()+'-'+mm+'-'+dd;
				var rdate=document.getElementById("return_date").value;;
				var ddate=document.getElementById("due_date").value;
				var rrdate=new Date(rdate);
				var dddate=new Date(ddate);
				var timediff=Math.floor(Date.UTC(rrdate.getFullYear(),rrdate.getMonth(),rrdate.getDate()))-(Date.UTC(dddate.getFullYear(),dddate.getMonth(),dddate.getDate()));
			
				alert(timediff);
				var diffdays=(Math.ceil(timediff/(1000*3600*24)));
				 if(diffdays<0)
				 diffdays=0;
				
				document.getElementById("days_delayed").value=diffdays;	
				document.getElementById("fine_amount").value=(diffdays*5);
				document.getElementById("fine_amount_paid").value=(diffdays*5);
			}//for(var i=0;i<x.length;i++)
				
				xmlhttp=null;
				x=null;
			} // if(xmlhttp.status==200)
		}
	}//try
	catch(e)
	{
		console.log(e);
		alert(e);
	}
}

function date_change()
{
		var rdate=document.getElementById("return_date").value;
		var ddate=document.getElementById("due_date").value;
		var rrdate=new Date(rdate);
		
				var dddate=new Date(ddate);
				var timediff=Math.floor(Date.UTC(rrdate.getFullYear(),rrdate.getMonth(),rrdate.getDate()))-(Date.UTC(dddate.getFullYear(),dddate.getMonth(),dddate.getDate()));
			
				//alert(timediff);
				var diffdays=(Math.ceil(timediff/(1000*3600*24)));
	             if(diffdays<0)
				 diffdays=0;
				//alert(diffdays);
				document.getElementById("days_delayed").value=diffdays;	
				document.getElementById("fine_amount").value=(diffdays*5);
				if(fine_amount<0)
				fine_amount=0;
				document.getElementById("fine_amount_paid").value=(diffdays*5);				
}
</script>
</head>

<body>
<form method="post" action="return_book">
<table>
<tr>
<td>Accession No.: </td>
<td colspan="3">
<input type="text" id="accession_no" name="accession_no" onKeyUp="search_acc()"></td>
</tr>
<tr>
<td>Issue date : </td>
<td><input type="text" id="issue_date" readonly="true"></td>
<td>Due Date:</td>
<td><input type="text" id="due_date" readonly="true"></td>
</tr>
<tr>
<td>Reader Id:</td>
<td><input type="text" id="reader_id" readonly="true"></td>
<td>Transction Id: </td>
<td><input type="text" id="trans_id" readonly="true"></td>
</tr>
<tr>
<td>Reader Name: </td>
<td><input type="text" id="reader_name"></td>
<td>Reader Type: </td>
<td><input type="text" id="reader_type" readonly="true"></td>
</tr>
<tr>
<td>Issued By:</td> 
<td><input type="text" id="issued_by" readonly="true"></td>
<td>Return Date:</td>
<td><input type="text" id="return_date" name="return_date" onChange="date_change()"></td>
</tr>

<tr>
<td>Days Delayed:</td>
<td><input type="text" id="days_delayed" name="days_delayed"></td>
<td>Reciept No.:</td>
<td><input type="text" id="receipt_no" name="receipt_no"></td>
</tr>
<tr>
<td>Fine Amount:</td>
<td><input type="text" id="fine_amount" name="fine_amount" value=""></td>
<td>Fine Paid:</td>
<td><input type="text" id="fine_amount_paid" name="fine_amount_paid"></td>
</tr>
<tr>
<td>Remark: </td> <td colspan="3"><textarea rows="4" cols="25"name="remark" id="remark"></textarea>
</td>
</tr>
</table>
<input type="button" value="submit" onClick="Update_query()">
</form>
<script type="text/javascript">
function Update_query()
{
	try
	{
		var fine_amount=Number(document.getElementById("fine_amount").value);
		if(fine_amount<0 )
		{
					alert("Wrong Input");
					return false;
		}
		var fine_amount_paid=Number(document.getElementById("fine_amount_paid").value);
		if(fine_amount_paid<0)
		{
					alert("Wrong Input");
					return false;
		}
		var url="trans_id="+document.getElementById("trans_id").value;
		url=url+"&return_date="+document.getElementById("return_date").value;
		url=url+"&days_delayed="+document.getElementById("days_delayed").value;
		url=url+"&fine_amount="+document.getElementById("fine_amount").value;
		url=url+"&fine_amount_paid="+document.getElementById("fine_amount_paid").value;
		url=url+"&receipt_no="+document.getElementById("receipt_no").value;
		url=url+"&remark="+document.getElementById("remark").value;
		url=url+"&issued_by="+document.getElementById("issued_by").value;
		alert(url);
		
		var con=confirm("Are you sure you want to continue")
		if(con==false)
		return false;
		
		xmlhttp=new XMLHttpRequest();
  		 xmlhttp.onreadystatechange =handleServerResponse_return;;
  		 xmlhttp.open("POST","return_book",true);
   		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   		xmlhttp.send(url);	

		}
		catch(e)
		{
			alert(e);
			return false;
		}
	}
function handleServerResponse_return()
{
	try
	{
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				alert(xmlhttp.responseText);
				document.getElementById("accession_no").value="";		
				document.getElementById("issue_date").value="";	
				document.getElementById("due_date").value="";	
				document.getElementById("reader_id").value="";	
				document.getElementById("trans_id").value="";
				document.getElementById("reader_name").value="";
				document.getElementById("reader_type").value="";
				document.getElementById("issued_by").value="";		
				document.getElementById("return_date").value="";	
				document.getElementById("days_delayed").value="";	
				document.getElementById("fine_amount").value="";	
				document.getElementById("fine_amount_paid").value="";
				document.getElementById("remark").value="";
				document.getElementById("receipt_no").value="";
				
				
				xmlhttp=null;
				}
			}
		}
		catch(e)
		{
			alert(e);
		}
	}			
</script>
</body>
</html>