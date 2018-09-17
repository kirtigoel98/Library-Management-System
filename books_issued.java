import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class books_issued extends HttpServlet
 {	
   public void doGet(HttpServletRequest request,HttpServletResponse response)throws 
   ServletException,IOException	
   {
     try
     {
     	
     	System.out.println("In");
     	
     	
     StringBuffer datatosend=new StringBuffer(1024); 
				  datatosend.append("<?xml version=\"1.0\"?>"); 
				  datatosend.append("<data>"); 
			
      String issue_date_to_search=request.getParameter("issue_date"); 
      String due_date_to_search=request.getParameter("due_date"); 
        		
       System.out.println(issue_date_to_search);
       System.out.println(due_date_to_search);
      
                       Connection con=null;
                       Statement st=null;
                      ResultSet rt=null;
                
      Class.forName("com.mysql.jdbc.Driver"); 
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
      st=con.createStatement();
		
		StringBuffer query =new StringBuffer(512);
		query.append("select accession_no,book_title,reader_id,reader_name,reader_section_desg,issue_date,due_date,return_date ");
		query.append("from lib_issue_return_book where issue_date between '").append(issue_date_to_search).append("' and '").append(due_date_to_search).append("'");	
	
		rt= st.executeQuery(query.toString());
	
         while(rt.next())
    	{
	  	datatosend.append("<lib_issue_return_book>");
		datatosend.append("<accession_no>").append(rt.getInt("accession_no")).append("</accession_no>");
		datatosend.append("<book_title>").append(rt.getString("book_title")).append("</book_title>");
		datatosend.append("<reader_id>").append(rt.getInt("reader_id")).append("</reader_id>");
		datatosend.append("<reader_name>").append(rt.getString("reader_name")).append("</reader_name>");
		datatosend.append("<reader_section_desg>").append(rt.getString("reader_section_desg")).append("</reader_section_desg>");
		datatosend.append("<issue_date>").append(rt.getString("issue_date")).append("</issue_date>"); 
		datatosend.append("<due_date>").append(rt.getString("due_date")).append("</due_date>");
		datatosend.append("<return_date>").append(rt.getString("return_date")).append("</return_date>");
		datatosend.append("</lib_issue_return_book>");
		}
		 rt.close();
		
		st.close();
		con.close();
		    	datatosend.append("</data>"); 					
		    	
		    						                                     
							response.setContentType("text/xml"); 
							response.setHeader("Cache-Control","no-cache"); 
							response.setHeader("Pragma","no-cache");				 
							response.setDateHeader ("Expires", 0); 
							response.getWriter().write(datatosend.toString());
							response.getWriter().flush();
							

							datatosend=null;
		       				System.out.println("Out");
		       				
	                            

   }
		catch(Exception e)
       {
           System.out.println(e);
           e.printStackTrace();
         }   		
   }

}		