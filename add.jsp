<!Doctype>
<html>
<head>
<script type="text/javascript">
var xmlhttp=null;
var prev_search_accession_no=0;

function resett_title()
{
	try
	{
				document.getElementById("title").title="";
				document.getElementById("author1").title="";
				document.getElementById("author2").title="";
				document.getElementById("edition").title="";
				document.getElementById("volume").title="";
				document.getElementById("no_of_pages").title="";
				document.getElementById("description").title="";
				document.getElementById("isbn").title="";
				document.getElementById("book_category").title="";
				document.getElementById("book_type").title="";
				document.getElementById("for_class").title="";
				document.getElementById("for_subject").title="";
				document.getElementById("book_no").title="";
				document.getElementById("classification_no").title="";
				
				document.getElementById("sample_book").title=-1;
				document.getElementById("reserve_book").title=-1;
				
				document.getElementById("almira_no").title="";
				document.getElementById("rack_no").title="";
				document.getElementById("remark_1").title="";
				document.getElementById("remark_2").title="";
				document.getElementById("publisher_name").title="";
				document.getElementById("publisher_place").title="";
				document.getElementById("publish_on_year").title="";
				document.getElementById("purchase_from").title="";
				document.getElementById("purchase_date").title="";
				document.getElementById("book_price").title="";
				document.getElementById("bill_no").title="";
		}
		catch(e)
		{  
		   console.log(e);
			alert(e);
		}
}

 function resett()
  { 
    try
	 {
	 			document.getElementById("title").value="";
				document.getElementById("author1").value="";
				document.getElementById("author2").value="";
				document.getElementById("edition").value="";
				document.getElementById("volume").value="";
				document.getElementById("no_of_pages").value="";
				document.getElementById("description").value="";
				document.getElementById("isbn").value="";
				document.getElementById("book_category").value="";
				document.getElementById("book_type").value="";
				document.getElementById("for_class").value="";
				document.getElementById("for_subject").value="";
				document.getElementById("book_no").value="";
				document.getElementById("classification_no").value="";
				
				document.getElementById("sample_book").checked=false;
				document.getElementById("sample_book").value=0;
				
				document.getElementById("reserve_book").checked=false;
				document.getElementById("reserve_book").value=0;
				
				document.getElementById("almira_no").value="";
				document.getElementById("rack_no").value="";
				document.getElementById("remark_1").value="";
				document.getElementById("remark_2").value="";
				document.getElementById("publisher_name").value="";
				document.getElementById("publisher_place").value="";
				document.getElementById("publish_on_year").value="";
				document.getElementById("purchase_from").value="";
				document.getElementById("purchase_date").value="";
				document.getElementById("book_price").value="";
				document.getElementById("bill_no").value="";

	 }
	 catch(e)
	  {  
	   console.log(e);
	    alert(e);
	  
	  }
}// function resett()

function onsubmitt()
{
	try
	{
		var title=document.getElementById("title").value;
		var author1=document.getElementById("author1").value;
		var author2=document.getElementById("author2").value;
		var edition=document.getElementById("edition").value;
		var no_of_pages=document.getElementById("no_of_pages").value;
		var description=document.getElementById("description").value;
		var isbn=document.getElementById("isbn").value;
		var book_category=document.getElementById("book_category").value;
		var book_type=document.getElementById("book_type").value;
		var for_class=document.getElementById("for_class").value;
		var for_subject=document.getElementById("for_subject").value;
		var book_no=document.getElementById("book_no").value;
		var classification_no=document.getElementById("classification_no").value;
		var almira_no=document.getElementById("almira_no").value;
	    var rack_no=document.getElementById("rack_no").value;
		if(title.length<3)
		{
		alert("Invalid title name");
		document.getElementById("title").focus();
		return false;
		}
		
			for(var loop=0;loop<name.length;loop++)
			{
				var ch=title.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch=='')||(ch=='.'))
				{
				}
				else
				{
					alert("Invalid name");
					document.getElementById("name").focus();
					return false;
				}
			}
			if(author1.length<5)
			{
				alert("Invalid author name");
				document.getElementById("author1").focus();
				return false;
			}
			for(var loop=0;loop<author1.length;loop++)
			{
				var ch=author1.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch==' 39'))
				{
				}
				else
				{
					alert("Invalid author name");
					document.getElementById("author1").focus();
					return false;
				}
			}
			if(author2.length<5)
			{
				alert("Invalid author name");
				document.getElementById("author2").focus();
				return false;
			}
			for(var loop=0;loop<author2.length;loop++)
			{
				var ch=author2.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch==' 39'))
				{
				}
				else
				{
					alert("Invalid author name");
					document.getElementById("author2").focus();
					return false;
				}
			}
			if(edition.length<=0)
			{
				alert("Invalid edition");
				document.getElementById("edition").focus();
				return false;
			}
			for(var loop=0;loop<edition.length;loop++)
			{
				var ch=edition.charAt(loop);
				if(ch>='1'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid edition");
					document.getElementById("edition").focus();
					return false;
				}
			}
			if(volume.length<=0)
			{
				alert("Invalid volume");
				document.getElementById("volume").focus();
				return false;
			}
			for(var loop=0;loop<volume.length;loop++)
			{
				var ch=volume.charAt(loop);
				if(ch>='1'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid volume");
					document.getElementById("volume").focus();
					return false;
				}
			}
			if(no_of_pages.length<=0)
			{
				alert("please enter page number");
				document.getElementById("no_of_pages").focus();
				return false;
			}
			for(var loop=0;loop<no_of_pages.length;loop++)
			{
				var ch=no_of_pages.charAt(loop);
				if(ch>='1'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid page number");
					document.getElementById("no_of_pages").focus();
					return false;
				}
			}
			if(description.length<=4)
			{
				alert("please give description");
				document.getElementById("description").focus();
				return false;
			}
			if(isbn.length<=0)
			{
				alert("Invalid isbn number");
				document.getElementById("isbn").focus();
				return false;
			}
			for(var loop=0;loop<isbn.length;loop++)
			{
				var ch=isbn.charAt(loop);
				if(ch>='1'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid isbn number");
					document.getElementById("isbn").focus();
					return false;
				}
			}
			if(book_category.length<=0)
			{
				alert("Invalid book category");
				document.getElementById("book_category").focus();
				return false;
			}
			for(var loop=0;loop<book_category.length;loop++)
			{
				var ch=book_category.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' '))
				{
				}
				else
				{
					alert("Invalid book_category");
					document.getElementById("book_category").focus();
					return false;
				}
			}
			if(book_type.length<=3)
			{
				alert("Invalid book type");
				document.getElementById("book_type").focus();
				return false;
			}
			for(var loop=0;loop<book_type.length;loop++)
			{
				var ch=book_type.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' '))
				{
				}
				else
				{
					alert("Invalid book_type");
					document.getElementById("book_type").focus();
					return false;
				}
			}
			if(for_class.length<=0)
			{
				alert("Enter class");
				document.getElementById("for_class").focus();
				return false;
			}
			for(var loop=0;loop<for_class.length;loop++)
			{
				var ch=for_class.charAt(loop);
				if(ch>='0'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid class");
					document.getElementById("for_class").focus();
					return false;
				}
			}
			if(for_subject.length<=0)
			{
				alert("Enter subject name");
				document.getElementById("for_subject").focus();
				return false;
			}
			for(var loop=0;loop<for_subject.length;loop++)
			{
				var ch=for_subject.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' '))
				{
				}
				else
				{
					alert("Invalid subject name");
					document.getElementById("for_subject").focus();
					return false;
				}
			}
			if(book_no.length<=0)
			{
				alert("Enter book number");
				document.getElementById("book_no").focus();
				return false;
			}
			for(var loop=0;loop<book_no.length;loop++)
			{
				var ch=book_no.charAt(loop);
				if(ch>='0'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid book number");
					document.getElementById("book_no").focus();
					return false;
				}
			}
			if(classification_no.length<=0)
			{
				alert("Enter classification number");
				document.getElementById("classification_no").focus();
				return false;
			}
			for(var loop=0;loop<classification_no.length;loop++)
			{
				var ch=classification_no.charAt(loop);
				if(ch>='0'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid classification number");
					document.getElementById("classification_no").focus();
					return false;
				}
			}
			if(almira_no.length<=0)
			{
				alert("Enter almira number");
				document.getElementById("almira_no").focus();
				return false;
			}
			for(var loop=0;loop<almira_no.length;loop++)
			{
				var ch=almira_no.charAt(loop);
				if(ch>='0'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid almira number");
					document.getElementById("almira_no").focus();
					return false;
				}
			}
			if(rack_no.length<=0)
			{
				alert("Enter rack number");
				document.getElementById("rack_no").focus();
				return false;
			}
			for(var loop=0;loop<rack_no.length;loop++)
			{
				var ch=rack_no.charAt(loop);
				if(ch>='0'&&ch<='9')
				{
				}
				else
				{
					alert("Invalid rack number");
					document.getElementById("rack_no").focus();
					return false;
				}
			}
			if(book_price.length<=0)
			{
				alert("Enter book price");
				document.getElementById("book_price").focus();
				return false;
			}
			for(var loop=0;loop<book_price.length;loop++)
			{
				var ch=book_price.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch<'0'))
				{
					alert("Invalid amount");
					document.getElementById("book_price").focus();
					return false;
				}
				else
				{
				}
			}
			
			if(publisher_place.length<5)
			{
				alert("please enter sufficent publisher place");
				document.getElementById("publisher_place").focus();
				return false;
			}
			if(purchase_date.length<8)
			{
				alert("please enter correct date");
				document.getElementById("purchase_date").focus();
				return false;
			}
			if(bill_no.length<=0)
			{
				alert("Enter bill number");
				document.getElementById("bill_no").focus();
				return false;
			}
			if(purchase_from.length<=0)
			{
				alert("Enter purchace from");
				document.getElementById("purchase_from").focus();
				return false;
			}
					for(var loop=0;loop<purchase_from.length;loop++)
					{
						
						var ch=purchase_from.charAt(loop);
						if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch==' 39'))
						{
						}
						else
						{
							alert("Invalid purchase from");
							document.getElementById("purchase_from").focus();
							return false;
						}
					}
			
					if(publish_on_year.length<=0)
					{
						alert("Enter correct publish year");
						document.getElementById("publish_on_year").focus();
						return false;
					}
					
			if(publisher_name.length<5)
			{
				alert("Invalid publisher name");
				document.getElementById("publisher_name").focus();
				return false;
			}
			for(var loop=0;loop<publisher_name.length;loop++)
			{
				var ch=publisher_name.charAt(loop);
				if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch==' ')||(ch==' 39'))
				{
				}
				else
				{
					alert("Invalid publisher name");
					document.getElementById("publisher_name").focus();
					return false;
				}
			}
			
			var c=confirm(" Are you sure you want to conitnue");
		if(c==false)
		return false;
		
	}
		catch(e)
	  {  
	   console.log(e);
	    alert(e);
	  
	  }
}

function book_no_function()
{
	try
	{
		var accession_no=document.getElementById("accession_no").value;
		if(accession_no.length==0)
			{
				alert("Invalid accession number");
				document.getElementById("accession_no").focus();
				return false;
			}
		var url="add?accession_no="+accession_no;
		//alert(url);
		xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=handleServerResponse;
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
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				//alert(xmlhttp.responseText);
				 resett();
				
				var xx,j=0;
				var temp;
				var title="";
				prev_search_accession_no=Number(document.getElementById("accession_no").value);
				
				var x =  xmlhttp.responseXML.documentElement.getElementsByTagName("member");
				
				for(var i=0;i<x.length;i++)
				{
					xx=x[i].getElementsByTagName("title");
					     
						  //if( xx[0].firstChild!=null )
					      title=xx[0].firstChild.nodeValue;
						  
					xx=x[i].getElementsByTagName("author1");
					var author1=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("author2");
					var author2=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("edition");
					var edition=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("volume");
					var volume=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("no_of_pages");
					var no_of_pages=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("description");
					var description=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("isbn");
					var isbn=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("book_category");
					var book_category=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("book_type");
					var book_type=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("status");
					var status=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("for_class");
					var for_class=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("for_subject");
					var for_subject=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("book_no");
					var book_no=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("classification_no");
					var classification_no=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("sample_book");
					var sample_book=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("reserve_book");
					var reserve_book=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("almira_no");
					var almira_no=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("rack_no");
					var rack_no=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("remark_1");
					var remark_1=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("remark_2");
					var remark_2=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("publisher_name");
					var publisher_name=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("publisher_place");
					var publisher_place=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("publish_on_year");
					var publish_on_year=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("purchase_from");
					var purchase_from=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("purchase_date");
					var purchase_date=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("book_price");
					var book_price=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("bill_no");
					var bill_no=xx[0].firstChild.nodeValue;
					xx=x[i].getElementsByTagName("purchase_date");
					var purchase_date=xx[0].firstChild.nodeValue;
			
					
					
					document.getElementById("title").value=title;
					document.getElementById("title").title=title;
					
					document.getElementById("author1").value=author1;
					document.getElementById("author1").title=author1;
					
					document.getElementById("author2").value=author2;
					document.getElementById("author2").title=author2;
					
					document.getElementById("edition").value=edition;
					document.getElementById("edition").title=edition;
					
					document.getElementById("volume").value=volume;
					document.getElementById("volume").title=volume;
					
					document.getElementById("no_of_pages").value=no_of_pages;
					document.getElementById("no_of_pages").title=no_of_pages;
				
					document.getElementById("description").value=description;
					document.getElementById("description").title=description;
	
					document.getElementById("isbn").value=isbn;
					document.getElementById("isbn").title=isbn;
					
					document.getElementById("book_category").value=book_category;
					document.getElementById("book_category").title=book_category;
					
					document.getElementById("book_type").value=book_type;
					document.getElementById("book_type").title=book_type;
					
					document.getElementById("status").value=status;
					document.getElementById("status").title=status;
					
					document.getElementById("for_class").value=for_class;
					document.getElementById("for_class").title=for_class;
				
					document.getElementById("for_subject").value=for_subject;
					document.getElementById("for_subject").title=for_subject;
					
					document.getElementById("book_no").value=book_no;
					document.getElementById("book_no").title=book_no;
					
					document.getElementById("classification_no").value=classification_no;
					document.getElementById("classification_no").title=classification_no;
					
					 if( Number(sample_book) == 1)
					 {
					document.getElementById("sample_book").checked = true;
					document.getElementById("sample_book").title=1;
					document.getElementById("sample_book").value =1;
					}
					else 
					{
						document.getElementById("sample_book").checked = false;
						document.getElementById("sample_book").title=0;
						document.getElementById("sample_book").value =0;
					}
					
					 if( Number(reserve_book) == 1)
					 {
					document.getElementById("reserve_book").checked=true;
					document.getElementById("reserve_book").title=1;
					document.getElementById("reserve_book").value=1;
					}
					else
					{
						document.getElementById("reserve_book").checked=false;
						document.getElementById("reserve_book").title=0;
						document.getElementById("reserve_book").value=0;
					}
					document.getElementById("almira_no").value=almira_no;
					document.getElementById("almira_no").title=almira_no;
				
					document.getElementById("rack_no").value=rack_no;
					document.getElementById("rack_no").title=rack_no;
					
					document.getElementById("remark_1").value=remark_1;
					document.getElementById("remark_1").title=remark_1;
					
					document.getElementById("remark_2").value=remark_2;
					document.getElementById("remark_2").title=remark_2;
					
					document.getElementById("publisher_name").value=publisher_name;
					document.getElementById("publisher_name").title=publisher_name;
					
					document.getElementById("publisher_place").value=publisher_place;
					document.getElementById("publisher_place").title=publisher_place;
					
					document.getElementById("publish_on_year").value=publish_on_year;
					document.getElementById("publish_on_year").title=publish_on_year;
					
					document.getElementById("purchase_from").value=purchase_from;
					document.getElementById("purchase_from").title=purchase_from;
					
					document.getElementById("book_price").value=book_price;
					document.getElementById("book_price").title=book_price;
					
					document.getElementById("bill_no").value=bill_no;
					document.getElementById("bill_no").title=bill_no;
					
					document.getElementById("purchase_date").value=purchase_date;
					document.getElementById("purchase_date").title=purchase_date;
					
					break;
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

/*  ####################################################################################################################### */



  function update_query()
  {
  	try
	{
		if(  Number(document.getElementById("accession_no").value) != Number(prev_search_accession_no) )
		{
			alert('it call reset');
			resett_title();
		}
		
		
	   						
				
						     var datatosend = "";
							 
							 var workdone = "Change In Lib_Book_Details";
							 
							 if ( document.getElementById("title").title.toLowerCase() != document.getElementById("title").value.toLowerCase() )
							 {
								datatosend = datatosend + "title='" + document.getElementById("title").value + "',";
								workdone   = workdone + " :Title[P]=" + document.getElementById("title").title + " [N]=" +  document.getElementById("title").value;
							 }
							if (  document.getElementById("author1").title.toLowerCase() != document.getElementById("author1").value.toLowerCase() )
							 {
								datatosend = datatosend + "author1='" + document.getElementById("author1").value + "',";
								workdone   = workdone + " :Author1[P]=" + document.getElementById("author1").title + " [N]=" +  document.getElementById("author1").value;
							}
							if (  document.getElementById("author2").title.toLowerCase() != document.getElementById("author2").value.toLowerCase()  ) 
							{
								datatosend = datatosend + "author2='" + document.getElementById("author2").value + "',";
								workdone   = workdone + "  :Author2[P]=" + document.getElementById("author2").title + " [N]=" +  document.getElementById("author2").value;
							}
							if (document.getElementById("edition").title.toLowerCase() != document.getElementById("edition").value.toLowerCase())
							 {
								datatosend = datatosend + "edition='" + document.getElementById("edition").value + "',";
								workdone   = workdone + " :Edition[P]=" + document.getElementById("edition").title + " [N]=" +  document.getElementById("edition").value;
							}
							if (document.getElementById("volume").title.toLowerCase() != document.getElementById("volume").value.toLowerCase()) 
							{
								datatosend = datatosend + "volume='" + document.getElementById("volume").value + "',";
								workdone   = workdone + " :Volume[P]=" + document.getElementById("volume").title + " [N]=" +  document.getElementById("volume").value;
							}
							if (Number(document.getElementById("no_of_pages").title) != Number(document.getElementById("no_of_pages").value)) 
							{
								datatosend = datatosend + "no_of_pages='" + document.getElementById("no_of_pages").value + "',";
								workdone   = workdone + " :No_of_pages[P]=" + document.getElementById("no_of_pages").title + " [N]=" +  document.getElementById("no_of_pages").value;
							}
							if (document.getElementById("description").title.toLowerCase() != document.getElementById("description").value.toLowerCase()) 
							{
								datatosend = datatosend + "description='" + document.getElementById("description").value + "',";
								workdone   = workdone + " :Description[P]=" + document.getElementById("description").title + " [N]=" +  document.getElementById("description").value;
							}
							if (document.getElementById("isbn").title.toLowerCase() != document.getElementById("isbn").value.toLowerCase()) 
							{
								datatosend = datatosend + "isbn='" + document.getElementById("isbn").value + "',";
								workdone   = workdone + " :Isbn[P]=" + document.getElementById("isbn").title + " [N]=" +  document.getElementById("isbn").value;
							}
							if (document.getElementById("book_category").title.toLowerCase() != document.getElementById("book_category").value.toLowerCase())
							 {
								datatosend = datatosend + "book_category='" +document.getElementById("book_category").value+ "',";
								workdone   = workdone + " :Book_category[P]=" + document.getElementById("book_category").title + " [N]=" +  document.getElementById("book_category").value;
							}
							if (document.getElementById("book_type").title.toLowerCase() != document.getElementById("book_type").value.toLowerCase())
							 {
								datatosend = datatosend + "book_type='" +document.getElementById("book_type").value + "',";
								workdone   = workdone + " :Book_type[P]=" + document.getElementById("book_type").title + " [N]=" +  document.getElementById("book_type").value;
							}
							if (Number(document.getElementById("status").title) != Number(document.getElementById("status").value)) 
							{
								datatosend = datatosend + "status='" + document.getElementById("status").value + "',";
								workdone   = workdone + " :Status[P]=" + document.getElementById("status").title + " [N]=" +  document.getElementById("status").value;
							}
							if (document.getElementById("for_class").title.toLowerCase() != document.getElementById("for_class").value.toLowerCase())
							 {
								datatosend = datatosend + "for_class='" + document.getElementById("for_class").value + "',";
								workdone   = workdone + " :For_class[P]=" + document.getElementById("for_class").title + " [N]=" +  document.getElementById("for_class").value;
							}
							if (document.getElementById("for_subject").title.toLowerCase() != document.getElementById("for_subject").value.toLowerCase())
							 {
								datatosend = datatosend + "for_subject='" + document.getElementById("for_subject").value + "',";
								workdone   = workdone + " :For_subject[P]=" + document.getElementById("for_subject").title + " [N]=" +  document.getElementById("for_subject").value;
							}
							if (document.getElementById("book_no").title.toLowerCase() != document.getElementById("book_no").value.toLowerCase())
							 {
								datatosend = datatosend + "book_no='" + document.getElementById("book_no").value + "',";
								workdone   = workdone + " :Book_no[P]=" + document.getElementById("book_no").title + " [N]=" +  document.getElementById("book_no").value;
							}
							if (document.getElementById("classification_no").title.toLowerCase() != document.getElementById("classification_no").value.toLowerCase()) 
							{
								datatosend = datatosend + "classification_no='" + document.getElementById("classification_no").value + "',";
								workdone   = workdone + " :Classification_no[P]=" + document.getElementById("classification_no").title + " [N]=" +  document.getElementById("classification_no").value;
							}
							
							   var prev_sample_book = Number(document.getElementById("sample_book").title);
							   var new_sample_book = 0;
							       if( document.getElementById("sample_book").checked == true)
								   new_sample_book=1;
							
							if ( prev_sample_book != new_sample_book) 
							{
								datatosend = datatosend + "sample_book='" + new_sample_book + "',";
								workdone   = workdone + " :Sample_book[P]=" + prev_sample_book  + " [N]=" +  new_sample_book;
							}
							
							    var prev_reserve_book = Number(document.getElementById("reserve_book").title); 
							    var new_reserve_book = 0;
								    if( document.getElementById("reserve_book").checked == true )
									new_reserve_book =1;
									
							 if ( prev_reserve_book != new_reserve_book )
							 {
								datatosend = datatosend + "reserve_book='" + new_reserve_book + "',";
								workdone   = workdone + " :Reserve_book[P]=" + prev_reserve_book + " [N]=" +  new_reserve_book;
							 }
							
							if (document.getElementById("almira_no").title.toLowerCase() != document.getElementById("almira_no").value.toLowerCase() )
							 {
								datatosend = datatosend + "almira_no='" + document.getElementById("almira_no").value + "',";
								workdone   = workdone + " :Almira_no[P]=" + document.getElementById("almira_no").title + " [N]=" +  document.getElementById("almira_no").value;
							}
							if (document.getElementById("rack_no").title.toLowerCase() != document.getElementById("rack_no").value.toLowerCase()) 
							{
								datatosend = datatosend + "rack_no='" + document.getElementById("rack_no").value+ "',";
								workdone   = workdone + " :Rack_no[P]=" + document.getElementById("rack_no").title + " [N]=" +  document.getElementById("rack_no").value;
							}
							if (document.getElementById("remark_1").title.toLowerCase() != document.getElementById("remark_1").value.toLowerCase())
							 {
								datatosend = datatosend + "remark_1='" + document.getElementById("remark_1").value + "',";
								workdone   = workdone + " :Remark_1[P]=" + document.getElementById("remark_1").title + " [N]=" +  document.getElementById("remark_1").value;
							}
							if (document.getElementById("remark_2").title.toLowerCase() != document.getElementById("remark_2").value.toLowerCase()) 
							{
								datatosend = datatosend + "remark_2='" + document.getElementById("remark_2").value + "',";
								workdone   = workdone + " :Remark_2[P]=" + document.getElementById("remark_2").title + " [N]=" +  document.getElementById("remark_2").value;
							}
							if (document.getElementById("publisher_name").title.toLowerCase() != document.getElementById("publisher_name").value.toLowerCase()) 
							{
								datatosend = datatosend + "publisher_name='" + document.getElementById("publisher_name").value + "',";
								workdone   = workdone + " :Publisher_name[P]=" + document.getElementById("publisher_name").title + " [N]=" +  document.getElementById("publisher_name").value;
							}
							if (document.getElementById("publisher_place").title.toLowerCase() != document.getElementById("publisher_place").value.toLowerCase()) 
							{
								datatosend = datatosend + "publisher_place='" + document.getElementById("publisher_place").value + "',";
								workdone   = workdone + " :Publisher_place[P]=" + document.getElementById("publisher_place").title + " [N]=" +  document.getElementById("publisher_place").value;
							}
							if ((document.getElementById("publish_on_year").title.toLowerCase()) != (document.getElementById("publish_on_year").value.toLowerCase()))
							 {
								datatosend = datatosend + " publish_on_year ='" + document.getElementById("publish_on_year").value + "',";
								workdone   = workdone + " :Publish_on_year[P]=" + document.getElementById("publish_on_year").title + " [N]=" +  document.getElementById("publish_on_year").value;
							}
							if (document.getElementById("purchase_from").title.toLowerCase() != document.getElementById("purchase_from").value.toLowerCase())
							 {
								datatosend = datatosend + "purchase_from='" + document.getElementById("purchase_from").value+ "',";
								workdone   = workdone + " :Purchase_from[P]=" + document.getElementById("purchase_from").title + " [N]=" +  document.getElementById("purchase_from").value;
							}
							if (document.getElementById("purchase_date").title != document.getElementById("purchase_date").value)
							 {
								datatosend = datatosend + "purchase_date='" + document.getElementById("purchase_date").value + "',";
								workdone   = workdone + " :Purchase_date[P]= " + document.getElementById("purchase_date").title + " [N]=" +  document.getElementById("purchase_date").value;
							}
							if (   Number(document.getElementById("book_price").title) != Number(document.getElementById("book_price").value) )
							 {
								datatosend = datatosend + "book_price='" + Number(document.getElementById("book_price").value) + "',";
								workdone   = workdone + " :Book_price[P]=" + document.getElementById("book_price").title + " [N]=" +  document.getElementById("book_price").value;
							}
							if (document.getElementById("bill_no").title.toLowerCase() != document.getElementById("bill_no").value.toLowerCase())
							 {
								datatosend = datatosend + "bill_no='" + document.getElementById("bill_no").value + "',";
								workdone   = workdone + " :Bill_no[P]=" + document.getElementById("bill_no").title + " [N]=" +  document.getElementById("bill_no").value;
							}
							 datatosend = datatosend.substring(0, datatosend.length - 1);
							 
							 
							 
							    xmlhttp = null;
								xmlhttp = new XMLHttpRequest();
								var url = "whichbutton=update_query";
								url = url + "&workdone=" + escape(workdone);
								url = url + "&datatosend=" + escape(datatosend);
								url = url + "&accession_no=" + document.getElementById("accession_no").value;
								
								  alert( url); 
								
								//url = url + "&txtuser=" + document.getElementById("txtuser").value;
								//url = url + "&code=" + document.getElementById("code").value;
								xmlhttp.onreadystatechange = handle_server_response_after_update_query;
								xmlhttp.open("POST", "add", true);
								xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
								//xmlhttp.setRequestHeader("Content-length", url.length);
								xmlhttp.send(url);
							 
								   
	    }//try
		catch(e)
		{
		  console.log(e);
		   alert(e);
		 }
  
  }// function update_query()
   


function handle_server_response_after_update_query()
{
	try
	{
		if(xmlhttp.readyState==4)
		{
			if(xmlhttp.status==200)
			{
				alert(xmlhttp.responseText);
				 	
							xmlhttp=null;
							prev_search_accession_no = document.getElementById("accession_no").value;
							
							
							
							
					document.getElementById("title").title=document.getElementById("title").value;
					
					document.getElementById("author1").title=document.getElementById("author1").value;
					
					document.getElementById("author2").title=document.getElementById("author2").value;
					
					document.getElementById("edition").title=document.getElementById("edition").value;
					
					document.getElementById("volume").title=document.getElementById("volume").value;
					
					document.getElementById("no_of_pages").title=document.getElementById("no_of_pages").value;
				
					document.getElementById("description").title=document.getElementById("description").value;
	
					document.getElementById("isbn").title=document.getElementById("isbn").value;
					
					document.getElementById("book_category").title=document.getElementById("book_category").value;
					
					document.getElementById("book_type").title=document.getElementById("book_type").value;
					
					document.getElementById("status").title=document.getElementById("status").value;
					
					document.getElementById("for_class").title=document.getElementById("for_class").value;
				
					document.getElementById("for_subject").title=document.getElementById("for_subject").value;
					
					document.getElementById("book_no").title= document.getElementById("book_no").value;
					
					document.getElementById("classification_no").title = document.getElementById("classification_no").value;
					
					if (document.getElementById("sample_book").checked == true)
					{
					 document.getElementById("sample_book").value=1;
					 document.getElementById("sample_book").title=1;
					}
					else
					{
					document.getElementById("sample_book").value=0;
					document.getElementById("sample_book").title = 0;
					}
					
							if (document.getElementById("reserve_book").checked==true)
							{
							 document.getElementById("reserve_book").value=1;
							 document.getElementById("reserve_book").title=1;
							}
							else
							{
							  document.getElementById("reserve_book").value=0;
							  document.getElementById("reserve_book").title=0;
							}
					
					document.getElementById("almira_no").title=document.getElementById("almira_no").value;
					document.getElementById("rack_no").title= document.getElementById("rack_no").value;
					document.getElementById("remark_1").title=document.getElementById("remark_1").value;
					document.getElementById("remark_2").title= document.getElementById("remark_2").value;
					document.getElementById("publisher_name").title=document.getElementById("publisher_name").value;
					document.getElementById("publisher_place").title=document.getElementById("publisher_place").value;
					document.getElementById("publish_on_year").title=document.getElementById("publish_on_year").value;
					document.getElementById("purchase_from").title=document.getElementById("purchase_from").value;
					document.getElementById("book_price").title=document.getElementById("book_price").value;
					document.getElementById("bill_no").title=document.getElementById("bill_no").value;
					document.getElementById("purchase_date").title=document.getElementById("purchase_date").value;
					
				}
				
				
			}
		}

	catch(e)
	{
	    console.log(e);
		alert(e);
	}
}

</script>
</head>
<body>
<form action="add" onsubmit="return onsubmitt()" >
  Enter accession number:
  <input type="text" name="accession_no" id="accession_no">
  <input type="button" value="Search" onClick="book_no_function()">

	<fieldset>
	<legend>Book Details:</legend>
    <table>
	<tr>
	<td>Title:</td> 
    <td><input type="text" name="title" id="title" maxlength="35"></td>
	<td width="100">       </td> 
     <td>Author 1:</td>
    <td><input type="text" name="author1" id="author1" maxlength="20"></td>
    </tr>
	<tr>
	<td>Author 2:</td>
    <td><input type="text" name="author2" id="author2" maxlength="20"></td>
	<td width="100">     </td> 
    <td>Edition:</td>
    <td><input type="text" name="edition" id="edition"></td>
    </tr>
	<tr>
	<td>Volume:</td>
    <td><input type="text" name="volume" id="volume"></td>
    <td width="100">     </td> 
	<td>No. Of Pages:</td>
    <td><input type="text" name="no_of_pages" id="no_of_pages"></td>
    </tr>
	<tr>
	<td>Description:</td>
    <td><input type="textarea" name="description" id="description" maxlength="40"></td>
    <td width="100">     </td> 
	<td>Isbn:</td>
    <td><input type="text" name="isbn" id="isbn"></td>
    </tr>
	<tr>
	<td>Book Category:</td>
	<td><input type="textarea" name="book_category" id="book_category"></td>
	<td width="100">     </td> 
	<td>Book Type:</td>
	<td><input type="textarea" name="book_type" id="book_type"></td>
	</tr>
	<tr>
	<td>Status:</td>
	<td>

						<select name="status" id="status">
					<option value="1">Active</option>
					<option value="0">Deleted</option>
					</select>

	</td>
	</tr>
</table>
	</fieldset>
   <fieldset>
    <legend>Book Details2:</legend>
    <table>
	<tr>
	<td>For Class:</td>
    <td><input type="text" name="for_class" id="for_class"> </td>
     <td>      </td> 
	 <td>For Subject:</td>
    <td><input type="text" name="for_subject" id="for_subject"></td>
    </tr>
	<tr>
	<td>Book NO.:</td>
    <td><input type="text" name="book_no" id="book_no"></td>
    <td> </td> 
	<td>Classifiction No.:</td>
    <td><input type="text" name="classification_no" id="classification_no"></td>
    </tr>
	<tr>
	<td>Almirah No.:</td>
    <td><input type="text" name="almira_no" id="almira_no"></td>
    <td>    </td> 
	<td>Rack No.:</td>
    <td><input type="text" name="rack_no" id="rack_no"></td>
    </tr>
	<tr>
	<td>Remark 1:</td>
    <td><input type="text" name="remark_1" id="remark_1" maxlength="30"></td>
    <td>     </td> 
	<td>Remark 2:</td>
    <td><input type="text" name="remark_2" id="remark_2" maxlength="30"></td>
	</tr>
	<tr>
	 <td>Is this book reserverd <input type="checkbox" name="reserve_book" id="reserve_book" value="1"></td>
	 <td>      </td> 
 	<td>Is this book is sample <input type="checkbox" name="sample_book" id="sample_book" value="1"> </td>
	</tr>
	</table>
  </fieldset>
  <fieldset>
    <legend>Publisher Detail:</legend>
    <tr> 
	<td>Name:</td>
    <td><input type="text" name="publisher_name" id="publisher_name"></td> 
    <td>    </td> 
	 <td>Place:</td>
    <td><input type="text" name="publisher_place" id="publisher_place"></td>
    </tr>
	<tr>
	<td>Year:</td>
    <td><input type="text" name="publish_on_year" id="publish_on_year"></td>
</tr>
</table>
  </fieldset>0
  <fieldset>
    <legend>Purchase Detail:</legend>
    <table>
	<tr> 
	<td>Purchase from:</td>
   <td><input type="text" name="purchase_from" id="purchase_from"></td> 
    <td>     </td> 
	<td>Date:</td>
   <td><input type="text" name="purchase_date" id="purchase_date"></td>
    </tr>
	<tr>
	<td>Price:</td>
    <td><input type="text" name="book_price" id="book_price"></td>
	<td>     </td> 
	<td>Bill no.</td>
	<td><input type="text" name="bill_no" id="bill_no"></td>
	</tr>
	</table>

  </fieldset>
  <fieldset>
    <legend>Book photo:</legend>
	<table></table>
	<tr>
    <td>Front photo:</td>
    <td><input type="text" name="front" id="front"></td> 
    <td>    </td> 
	<tr>
	<td>Back cover photo:</td>
    <td><input type="text" name="back" id="back"></td>
	<td>    </td> 
	
	</tr>
	</table>
  </fieldset>
  <input type="button" value="update" onclick="update_query()">
  <input type="button" value="reset" onclick="resett()">
</form>
</body>
</html>