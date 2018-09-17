import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class add extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	try
	{
				
				System.out.println("abc");
				
				
	 	StringBuffer datatosend=new StringBuffer(1024);
	 	datatosend.append("<?xml version=\"1.0\"?>");
	 	datatosend.append("<data>");
	 	String accession_no=request.getParameter("accession_no");
	 	System.out.println(accession_no);
	 	Connection con=null;
	 	Statement st=null;
	 	ResultSet rt=null;
	 	
	 	
	 	Class.forName("com.mysql.jdbc.Driver");
	 	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
	 	st=con.createStatement();
	 	
	 	  StringBuffer query =new StringBuffer(512);
	 	   query.append("select title,author1,author2,edition,volume,no_of_pages,description,isbn,book_category,book_type,status,for_class,for_subject,book_no,");
	 	   query.append("classification_no,sample_book,reserve_book,almira_no,rack_no,remark_1,remark_2,publisher_name,publisher_place,publish_on_year,purchase_from,");
	 	   query.append("purchase_date,book_price,bill_no from lib_book_details");
	 	   query.append(" where accession_no=").append(accession_no);
	 	
	 	
	 	String title="",author1="",author2="",edition="",volume="",no_of_pages="",description="",isbn="",book_category="",book_type="",status="",for_class="";
	 	String for_subject="",book_no="",classification_no="",sample_book="",reserve_book="",almira_no="",rack_no="",remark_1="",remark_2="";
	 	String publisher_name="",publisher_place="",publish_on_year="",purchase_from="",purchase_date="",book_price="",bill_no="",date="";
	 	int found=0;
	 	rt=st.executeQuery(query.toString());
	 	while(rt.next())
	 	{
	 		 found=1;
	 		 
	 		 title = rt.getString("title");
	 		 author1 = rt.getString("author1");
	 		 author2 = rt.getString("author2");
	 		 edition = rt.getString("edition");
	 		 volume = rt.getString("volume");
	 		 no_of_pages = rt.getString("no_of_pages");
	 		 description = rt.getString("description");
	 		 isbn = rt.getString("isbn");
	 		 book_category = rt.getString("book_category");
	 		 book_type = rt.getString("book_type");
	 		 status = rt.getString("status");
	 		 for_class = rt.getString("for_class");
	 		 for_subject = rt.getString("for_subject");
	 		 book_no = rt.getString("book_no");
	 		 classification_no = rt.getString("classification_no");
	 		 sample_book = rt.getString("sample_book");
	 		 reserve_book = rt.getString("reserve_book");
	 		 almira_no = rt.getString("almira_no");
	 		 rack_no = rt.getString("rack_no");
	 		 remark_1 = rt.getString("remark_1");
	 		 remark_2 = rt.getString("remark_2");
	 		 publisher_name = rt.getString("publisher_name");
	 		 publisher_place = rt.getString("publisher_place");
	 		 publish_on_year = rt.getString("publish_on_year");
	 		 purchase_from = rt.getString("purchase_from");
	 		 purchase_date = rt.getString("purchase_date");
	 		 book_price = rt.getString("book_price");
	 		 bill_no = rt.getString("bill_no");
	 	}
	 	rt.close();
	
	
	
	 		datatosend.append("<member>");
	 		
	 		datatosend.append("<title>").append("<![CDATA[").append(title).append("]]>").append("</title>");
	 		datatosend.append("<author1>").append("<![CDATA[").append(author1).append("]]>").append("</author1>");
	 		datatosend.append("<author2>").append("<![CDATA[").append(author2).append("]]>").append("</author2>");
	 		datatosend.append("<edition>").append("<![CDATA[").append(edition).append("]]>").append("</edition>");
	 		datatosend.append("<volume>").append("<![CDATA[").append(volume).append("]]>").append("</volume>");
	 		datatosend.append("<no_of_pages>").append("<![CDATA[").append(no_of_pages).append("]]>").append("</no_of_pages>");
	 		datatosend.append("<description>").append("<![CDATA[").append(description).append("]]>").append("</description>");
	 		datatosend.append("<isbn>").append("<![CDATA[").append(isbn).append("]]>").append("</isbn>");
	 		datatosend.append("<book_category>").append("<![CDATA[").append(book_category).append("]]>").append("</book_category>");
	 		datatosend.append("<book_type>").append("<![CDATA[").append(book_type).append("]]>").append("</book_type>");
	 		datatosend.append("<status>").append("<![CDATA[").append(status).append("]]>").append("</status>");
	 		datatosend.append("<for_class>").append("<![CDATA[").append(for_class).append("]]>").append("</for_class>");
	 		datatosend.append("<for_subject>").append("<![CDATA[").append(for_subject).append("]]>").append("</for_subject>");
	 		datatosend.append("<book_no>").append("<![CDATA[").append(book_no).append("]]>").append("</book_no>");
	 		datatosend.append("<classification_no>").append("<![CDATA[").append(classification_no).append("]]>").append("</classification_no>");
	 		datatosend.append("<sample_book>").append("<![CDATA[").append(sample_book).append("]]>").append("</sample_book>");
	 		datatosend.append("<reserve_book>").append("<![CDATA[").append(reserve_book).append("]]>").append("</reserve_book>");
	 		datatosend.append("<almira_no>").append("<![CDATA[").append(almira_no).append("]]>").append("</almira_no>");
	 		datatosend.append("<rack_no>").append("<![CDATA[").append(rack_no).append("]]>").append("</rack_no>");
	 		datatosend.append("<remark_1>").append("<![CDATA[").append(remark_1).append("]]>").append("</remark_1>");
	 		datatosend.append("<remark_2>").append("<![CDATA[").append(remark_2).append("]]>").append("</remark_2>");
	 		datatosend.append("<publisher_name>").append("<![CDATA[").append(publisher_name).append("]]>").append("</publisher_name>");
	 		datatosend.append("<publisher_place>").append("<![CDATA[").append(publisher_place).append("]]>").append("</publisher_place>");
	 		datatosend.append("<publish_on_year>").append("<![CDATA[").append(publish_on_year).append("]]>").append("</publish_on_year>");
	 		datatosend.append("<purchase_from>").append("<![CDATA[").append(purchase_from).append("]]>").append("</purchase_from>");
	 		datatosend.append("<purchase_date>").append("<![CDATA[").append(purchase_date).append("]]>").append("</purchase_date>");
	 		datatosend.append("<book_price>").append("<![CDATA[").append(book_price).append("]]>").append("</book_price>");
	 		datatosend.append("<bill_no>").append("<![CDATA[").append(bill_no).append("]]>").append("</bill_no>");
	 		datatosend.append("</member>");
	 	
	 	
	 	if(found==0)
	 	{
	 		query.delete(0,query.length());
	 		query.append("insert into lib_book_details (accession_no,date,time) values(");
	 		query.append(accession_no).append(",curdate(),curtime() )");
	 		
	 		st.executeUpdate(query.toString());
	 	}
	 	
	 	st.close();
	 	con.close();
	 	datatosend.append("</data>");
	 	
	 	response.setContentType("text/xml");
	 	response.setHeader("Cache-Control","no-cache");
	 	response.setHeader("pragma","no-cache");
	 	response.setDateHeader("Expires",0);
	 	
	 	response.getWriter().write(datatosend.toString());
	 	response.getWriter().flush();
	    
	    datatosend=null;
	    
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    	System.out.println(e);
	    }
}



public void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException	 
{
	try
	{
		String whichbutton=request.getParameter("whichbutton");
		if(whichbutton.equals("update_query"))
		{
		Connection con=null;
		Statement st=null;
		ResultSet rt=null;
		   	
	 	Class.forName("com.mysql.jdbc.Driver");
	 	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
	 	st=con.createStatement();
	 	StringBuffer query1=new StringBuffer();
	 	
	 	String accession_no=request.getParameter("accession_no");
	 	
	 	query1=new StringBuffer(512);
	 	query1.append("select accession_no from lib_book_details where accession_no=").append(accession_no);
	 		System.out.println(query1.toString());
	 		rt=st.executeQuery(query1.toString());
	 	
	 	int flag=0;
	 	while(rt.next())
	 	{
	 	 flag=1;
	 	}
	 	rt.close();
	 	
	 	
	 	    if( flag == 0)
	 	     {
	 	      		query1.delete(0,query1.length());
	 				query1.append("insert into lib_book_details (accession_no,date,time) values(");
	 				query1.append(accession_no).append(",curdate(),curtime() )");
	 		
	 				st.executeUpdate(query1.toString());	
	 	     	
	 	     }
	 	     
	 	
	 	
  			String datatosend=request.getParameter("datatosend");
 				StringBuffer query=new StringBuffer();
	   			query=new StringBuffer(512);	 
	   	 		query.append("update lib_book_details").append(" set ").append(datatosend).append(" where accession_no=").append(accession_no);
   	      
                  System.out.println(query.toString());
 
   	      		st.executeUpdate(query.toString());
   	  
			
	 	
	 	
	 	response.setContentType("text/xml");
	 	response.setHeader("Cache-Control","no-cache");
	 	response.setHeader("pragma","no-cache");
	 	response.setDateHeader("Expires",0);
	 	
	 	
	 	
	 	response.getWriter().write("Successfully Executed");
	 	response.getWriter().flush();
	 }
	 }
	 catch(Exception e)
	 {
	 	 	e.printStackTrace();
	 	System.out.println(e);
	 	
	}
}
	
}	

	 	
	 	
	 		