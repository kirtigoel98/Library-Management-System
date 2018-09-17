<html>


<Script>
var xmlhttp=null;
function search_accession_no()
{
  try
  {
   var accno=document.getElementById("accession_no_to_search").value;
      if( accno.length == 0)
	 return false;
	  
	  
	  				   var table = document.getElementById("idtable");             
   						var rowCount = table.rows.length;     
		   					
		  					for(var i=0; i<rowCount; i++) 
		 					 {                 
		  						  var table_accession_no = table.rows[i].cells[1].innerHTML;
								        
										if( Number(accno) == Number(table_accession_no) ) 
										{
											alert("Alredy Exist");
											return false;
										}
		   					}
							

	  
	  
   var url="issue_book?accession_no_to_search="+accno;
   xmlhttp=new XMLHttpRequest();
   xmlhttp.onreadystatechange = handleServerResponse;
   xmlhttp.open("GET",url,true);
   xmlhttp.send();
  }
  catch(e)
  {
   alert(e);return false;
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
			   
					//var x=xmlhttp.responseXML.documentElement.getElementsByTagName("accession_no_to_search");
						//var accession_no_to_search=document.getElementById("accession_no_to_search").value; 
						
						var table = document.getElementById("idtable"); 
	  					  var rowCount = table.rows.length;    /*this variable holds the length of rows in the table */
				
			     //  for(var loop=1;loop<rowCount;loop++)   /*This loop is for traversing all the rows of a table */
				  // table.deleteRow(1);
						
						var x=xmlhttp.responseXML.documentElement.getElementsByTagName("lib_book_details");
						
					   for (var i=0;i<x.length;i++)
					    {
						   xx=x[i].getElementsByTagName("accession_no");
						   var accession_no=xx[0].firstChild.nodeValue;
	
						    xx=x[i].getElementsByTagName("title");
						   var title=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("author1");
						   var author1=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("for_class");
						   var for_class=xx[0].firstChild.nodeValue;
						 
							xx=x[i].getElementsByTagName("for_subject");
						   var for_subject=xx[0].firstChild.nodeValue;
						   
						   xx=x[i].getElementsByTagName("status");
						   var status=xx[0].firstChild.nodeValue;
						   if( Number(status)==1 )
						   {
						   		alert("This Book Already Issued");
								return false;
						   }
						   
						     tr= document.createElement('tr'); 
						   
						            var element_ch = document.createElement("input");  
									element_ch.setAttribute("type","checkbox"); 
									element_ch.setAttribute("name","checkbox_accession_no"); 
									element_ch.setAttribute("value",accession_no); 
								               var td=null;
									td = document.createElement('td');
									td.appendChild(element_ch); 
									tr.appendChild(td)
						   
						 					 
						   
						    td = document.createElement('td');
							td.innerHTML=accession_no;
							tr.appendChild(td);  
							
							td = document.createElement('td');
							td.innerHTML=title;
							tr.appendChild(td);
							
							td = document.createElement('td');
							td.innerHTML=author1;
							tr.appendChild(td);    
						   
						    td = document.createElement('td');
							td.innerHTML=for_class;
							tr.appendChild(td);
							
							td = document.createElement('td');
							td.innerHTML=for_subject;
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
   }
}


function delete_checked_rows()
{
  try
   {             
   var table = document.getElementById("idtable");             
   var rowCount = table.rows.length;     
		   
		  for(var i=1; i<rowCount; i++) 
		  {                 
		   var row = table.rows[i];                 
		   var chkbox = row.cells[0].childNodes[0];                 
			   if( (chkbox != null) && (chkbox.checked == true) ) 
			   {                     
			   table.deleteRow(i);                     
			   rowCount--;                     
			   i--;                 
			   }               
		   }             
	}
       catch(e) 
	   {                 
			 alert(e+" Exception At Client Side In Prescription -> Delete_checked_rows");
			 return false;             
	   }							   
}	

</Script>

<%//formno +"#" + name+"#"+ gname+ "#"+section;
  String radio_value = request.getParameter("radio_student_id");
  String array[]=radio_value.split("#",-1);
   String reader_type=request.getParameter("reader_type");
  
     
  
  
   String formno = array[0];
   String name = array[1];
   String gname =array[2];
   String section =array[3];  
%>


<body>
<form method="post" action="issue_book" >
<fieldset>
	<legend>Reader Details:</legend>
    <table>
	<tr>
	<td>ID:</td> 
    <td><input type="text" value="<%=formno%>" readonly="true" name="formno" id="formno" maxlength="35"></td>
	<td width="100">       </td> 
     <td>Name:</td>
    <td><input type="text"  value="<%=name%>" name="name" id="name" maxlength="20"></td>
    </tr>
	<tr>
	<td>Father's Name:</td>
    <td><input type="text" value="<%=gname%>" name="father_name" id="father_name" maxlength="20"></td>
	<td width="100">     </td> 
    <td>Section:</td>
    <td><input type="text" name="section" value="<%=section%>" id="section"></td>
    </tr>
	<tr>
	<td></td>
	<td><input type="hidden" name="reader_type" value="<%=reader_type%>" id="reader_type"></td>
	</tr>
	</table>
	</fieldset>
	
   <fieldset>
    <legend>Book Details:</legend>
    <table>
	<tr>
	<td>Accession No.:</td>
    <td><input type="text" name="accession_no_to_search" id="accession_no_to_search"> </td>
	<td><input type="button" value="Add" Onclick="search_accession_no()"></td>
	<td>             </td>
	<td><input type="button"  value="Del" Onclick="delete_checked_rows()"></td>
     </tr> 
	 </table>
	 <table align="center" cellpadding="2" border="1" id="idtable" style="border-collapse:collapse; ">
  <tbody>
   <tr>
   <td></td>
   <td>Accession No.</td>
   <td>Book Title</td>
   <td>Author</td>
   <td>class</td>
   <td>subject</td>
   </tr>
   </tbody>
</table>
</fieldset>

<fieldset>  

<tr>
<td>Issue date:</td>
<input type="text" name="issue_date" id="issue_date">
</tr>
<tr>
<td>Due date:</td>
<input type="text" name="due_date" id="due_date">
</tr>
<tr>
<td>Remark:</td>
<textarea rows="4" cols="25"name="remark" id="remark"></textarea>
</tr>

</fieldset>
<input type="button" value="button" onclick="onsubmit_return_book()">
</form>
<script type="text/javascript">
 function onsubmit_return_book()
 { 
  try
    {
	    
   var table = document.getElementById("idtable");             
   var rowCount = table.rows.length;     
		   var temp_accession_no="";
		   var temp_book_title="";
			  for(var i=1; i<rowCount; i++) 
			  {                 
			   var row = table.rows[i];                 
			   var accession_no = row.cells[1].innerHTML;                 
				var book_title=row.cells[2].innerHTML;		   
						   temp_accession_no = temp_accession_no + accession_no +"#"; 
						   temp_book_title= temp_book_title+book_title+"#";
			   }   
			   
		  if( temp_accession_no.length <1 )
		  {
		    alert("Nothing To Save");
			return false;
		  } 
		  if( temp_book_title.length <1 )
		  {
		    alert("Nothing To Save");
			return false;
		  } 
		   temp_accession_no=temp_accession_no.substring(0,temp_accession_no.length-1);
		   
		   temp_book_title=temp_book_title.substring(0,temp_book_title.length-1); 
		   
		   
       var url="all_accession_no="+temp_accession_no;
	   url = url+"&all_book_title="+temp_book_title;
       url = url+"&due_date="+ document.getElementById("due_date").value;
	   url = url+"&issue_date="+ document.getElementById("issue_date").value;
	   url = url+"&remark="+ document.getElementById("remark").value;
	   url = url+"&reader_id="+ document.getElementById("formno").value;
	   url = url+"&reader_type="+ document.getElementById("reader_type").value;
	   url=url+"&reader_name="+document.getElementById("name").value;
	   
	   alert(url); 
	   
	  var con = confirm("Are You Sure Want To Continue");
	    if(con==false)
		return false;
	
   xmlhttp=new XMLHttpRequest();
   xmlhttp.onreadystatechange = hSR_issue_book;
   xmlhttp.open("POST","issue_book",true);
   xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xmlhttp.send(url);		   
	}
	catch(e)
	{
	  alert(e+ " Exception In Onsbumit_Return_book");
	  console.log(e);
	} 
 }


function hSR_issue_book()
{
try
  {
    	   if (xmlhttp.readyState == 4) 
		   {
		     if(xmlhttp.status == 200)
			 {
						  
						alert( xmlhttp.responseText);
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