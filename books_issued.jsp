<html>
<head>
</head>
<Script>
var xmlhttp=null;
function search_date()
{
  try
  {
   var date=document.getElementById("issue_date").value;
      if( issue_date.length == 0)
	 return false;
	  
   var url="books_issued?issue_date="+date;
   url=url+"&due_date="+document.getElementById("due_date").value;
   alert(url);
   xmlhttp=new XMLHttpRequest();
   xmlhttp.onreadystatechange = handleServerResponse;
   xmlhttp.open("GET",url,true);
   xmlhttp.send();
  }
  catch(e)
  {
  console.log(e);
   alert(e);
   return false;
  }
}

function handleServerResponse()
{
try
  {
    	   if (xmlhttp.readyState == 4) 
		   {
		     if(xmlhttp.status == 200) 
			 {  
				//alert(xmlhttp.responseText); 
				var xx,j=0;
			   var temp;

						 var table = document.getElementById("idtable"); 
	  					  var rowCount = table.rows.length;    /*this variable holds the length of rows in the table */
					
					   for(var loop=1;loop<rowCount;loop++)   /*This loop is for traversing all the rows of a table */
					   table.deleteRow(1);
							
						var x=xmlhttp.responseXML.documentElement.getElementsByTagName("lib_issue_return_book");
					
					   for (var i=0;i<x.length;i++)
					    {
						   xx=x[i].getElementsByTagName("accession_no");
						   var accession_no=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("book_title");
						   var book_title=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("reader_name");
						   var reader_name=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("reader_id");
						   var reader_id=xx[0].firstChild.nodeValue;
						 
						    
							xx=x[i].getElementsByTagName("reader_section_desg");
						   var reader_section_desg=xx[0].firstChild.nodeValue;
						   
						   xx=x[i].getElementsByTagName("issue_date");
						   var issue_date=xx[0].firstChild.nodeValue;
						   			
							xx=x[i].getElementsByTagName("due_date");
						   var due_date=xx[0].firstChild.nodeValue;
						   
						   xx=x[i].getElementsByTagName("return_date");
						   var return_date=xx[0].firstChild.nodeValue;		
						   			   
						   tr= document.createElement('tr'); 
						   
						 /* var radio_value = formno +"#" + name+"#"+ gname+ "#"+section+"#"+reader_type;
						            var element_ch = document.createElement("input");  
									element_ch.setAttribute("type","radio"); 
									element_ch.setAttribute("name","radio_student_id"); 
									element_ch.setAttribute("value", radio_value); 
								    element_ch.setAttribute("checked",true); */
								    /*
									var td=null;
									td = document.createElement('td');
									td.appendChild(element_ch); 
									tr.appendChild(td);*/
						   
						    td = document.createElement('td');
							td.innerHTML=accession_no;
							tr.appendChild(td);  
							
							td = document.createElement('td');
							td.innerHTML=book_title;
							tr.appendChild(td);
							
							td = document.createElement('td');
							td.innerHTML=reader_name;
							tr.appendChild(td);    
						   
						    td = document.createElement('td');
							td.innerHTML=reader_id;
							tr.appendChild(td);  
						   
						   td = document.createElement('td');
							td.innerHTML=reader_section_desg;
							tr.appendChild(td); 
						    
							td = document.createElement('td');
							td.innerHTML=issue_date;
							tr.appendChild(td); 
							
							td = document.createElement('td');
							td.innerHTML=due_date;
							tr.appendChild(td); 
							
							td = document.createElement('td');
							td.innerHTML=return_date;
							tr.appendChild(td); 
						   
						   table.getElementsByTagName("tbody")[0].appendChild(tr);
						}
		
			xmlhttp=null;
				
			 }
		  }	  
  }
  catch(e)
   {
    alert(e);
	console.log(e);
   }   
}

</Script>

<body>
<form method="get" action="books_issued" >
  Enter issue date:
  <input type="text" name="issue_date" id="issue_date">
 	Enter due date:
  <input type="text" name="due_date" id="due_date">
  <input type="button" value="Search" onClick="search_date()">
   <table align="center" cellpadding="2" border="1" id="idtable" style="border-collapse:collapse; ">
  <tbody>
   <tr>
  
   <td>Book Id</td>
   <td>Title</td>
   <td>Student name</td>
   <td>Reader Id</td>
   <td>Class and section</td>
   <td>Issue date</td>
   <td>Due date</td>
   <td>Return date</td>
   </tr>
   </tbody>
</table>

</body>
</html>