<html>
<Script>
var xmlhttp=null;
function search_name()
{
  try
  {
   var name=document.getElementById("name_to_search").value;
      if( name.length == 0)
	 return false;
	  
   var url="select_student?name_to_search="+name;
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
			   
				var reader_type=reader_type;

						 var table = document.getElementById("idtable"); 
	  					  var rowCount = table.rows.length;    /*this variable holds the length of rows in the table */
					
					   for(var loop=1;loop<rowCount;loop++)   /*This loop is for traversing all the rows of a table */
					   table.deleteRow(1);
							
						var x=xmlhttp.responseXML.documentElement.getElementsByTagName("fleb2017");
					
					   for (var i=0;i<x.length;i++)
					    {
						   xx=x[i].getElementsByTagName("formno");
						   var formno=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("name");
						   var name=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("gname");
						   var gname=xx[0].firstChild.nodeValue;
						   
						    xx=x[i].getElementsByTagName("section");
						   var section=xx[0].firstChild.nodeValue;
						 
						    						   
						   tr= document.createElement('tr'); 
						   
						    var radio_value = formno +"#" + name+"#"+ gname+ "#"+section+"#"+reader_type;
						            var element_ch = document.createElement("input");  
									element_ch.setAttribute("type","radio"); 
									element_ch.setAttribute("name","radio_student_id"); 
									element_ch.setAttribute("value", radio_value); 
								    element_ch.setAttribute("checked",true); 
								    
									var td=null;
									td = document.createElement('td');
									td.appendChild(element_ch); 
									tr.appendChild(td)
						   
						    td = document.createElement('td');
							td.innerHTML=formno;
							tr.appendChild(td);  
							
							td = document.createElement('td');
							td.innerHTML=name;
							tr.appendChild(td);
							
							td = document.createElement('td');
							td.innerHTML=gname;
							tr.appendChild(td);    
						   
						    td = document.createElement('td');
							td.innerHTML=section;
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

</Script>

<body>
<form method="post" action="select_student" >
Academic year:
<select name="academic_year" id="academic_year">
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
</select>
Reader type:
<select name="reader_type" id="reader_type">
<option value="S">Student
</option>
<option value="T">Staff
</option>
</select>
Name:
<input type ="text" name="name_to_search" id="name_to_search" value="" maxlength="35">
<input type="button" value="Search"  Onclick="search_name()">
 <table align="center" cellpadding="2" border="1" id="idtable" style="border-collapse:collapse; ">
  <tbody>
   <tr>
   <td></td>
   <td>Form no.</td>
   <td>Name</td>
   <td>Guardian Name</td>
   <td>Section</td>
   </tr>
   </tbody>
</table>
<input type="submit" value="submit"  name="issue_book">
</form>
</body>
</html>