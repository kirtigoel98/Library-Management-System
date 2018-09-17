import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class issue_book extends HttpServlet
 {	
   public void doGet(HttpServletRequest request,HttpServletResponse response)throws 
   ServletException,IOException	
   {
     try
     {
     	
     	/*String accession_no_to_search=request.getParameter("accession_no_to_search");
				String reader_id=request.getParameter("formno");
     	*/System.out.println("In");
     	
     	
     StringBuffer datatosend=new StringBuffer(1024); 
				  datatosend.append("<?xml version=\"1.0\"?>"); 
				  datatosend.append("<data>"); 
			
      String accession_no_to_search=request.getParameter("accession_no_to_search");   		
      System.out.println(accession_no_to_search);
      
      
                       Connection con=null;
                       Statement st=null;
                      ResultSet rt=null;
                
      Class.forName("com.mysql.jdbc.Driver"); 
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
      st=con.createStatement();
		
		int status=2;
		String query=null;
		
		  query= "select status from lib_issue_return_book where accession_no="+accession_no_to_search;
		  rt = st.executeQuery( query );
		  while( rt.next() )
		  {
		    	status = rt.getInt("status");
		  }
		  rt.close(); 
		  
		
		
		
		query=null;
		query="select accession_no,title,author1,for_class,for_subject,status from lib_book_details where accession_no="+accession_no_to_search;	
		
		rt=st.executeQuery(query);
	
        while(rt.next())
    	{
	  		datatosend.append("<lib_book_details>");
			datatosend.append("<accession_no>").append(rt.getInt("accession_no")).append("</accession_no>");
			datatosend.append("<title>").append(rt.getString("title")).append("</title>");
			datatosend.append("<author1>").append(rt.getString("author1")).append("</author1>");
			datatosend.append("<for_class>").append(rt.getString("for_class")).append("</for_class>");
			datatosend.append("<for_subject>").append(rt.getString("for_subject")).append("</for_subject>");
			datatosend.append("<status>").append(status).append("</status>");
			datatosend.append("</lib_book_details>");
		}
	
		 rt.close();
		
		st.close();
		
		
		/*st=con.createStatement();
		StringBuffer query=new StringBuffer(1024);
				query.append("insert into lib_issue_return_book (accession_no,reader_id,reader_type,issue_date,due_date,return_date,remark");
				query.append(" )values (").append(accession_no_to_search).append(",");
				query.append(reader_id).append(",'").append(reader_t).append("','").append(issue_date);
				query.append("','").append(due_date).append("','").append(due_date).append("','");
				query.append(remark).append("')");
						
			
			    System.out.println(query.toString());
			
				st.executeUpdate(query.toString());
				
					st.close();
					con.close();
		*/
		
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
         }     		
   }
   
   
   	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException ,IOException
		{
			try
			{
				String all_accession_no=request.getParameter("all_accession_no");
				String all_book_title=request.getParameter("all_book_title");
				String reader_id=request.getParameter("reader_id");
				String issue_date=request.getParameter("issue_date");
				String due_date=request.getParameter("due_date");
				String return_date= due_date;
				String remark=request.getParameter("remark");
				
				String reader_type=request.getParameter("reader_type");
				String reader_name=request.getParameter("reader_name");
				
				
				 System.out.println( all_accession_no +" check working");
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=null;
				Statement st=null;
				ResultSet rt=null;
			
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
				st=con.createStatement();
			
				
				String accession_no[] = all_accession_no.split("#",-1);
				String book_title[]=all_book_title.split("#",-1);
				
				for(int loop=0; loop< accession_no.length; loop++)
				{
					
					StringBuffer query=new StringBuffer(1024);
					query.append("insert into lib_issue_return_book (accession_no,reader_id,reader_type,reader_name,issue_date,due_date,return_date,remark,status,book_title");
					query.append(" )values (").append(accession_no[loop]).append(",");
					query.append(reader_id).append(",'").append(reader_type).append("','").append(reader_name).append("','").append(issue_date);
					query.append("','").append(due_date).append("','").append(due_date).append("','");
					query.append(remark).append("',1,'").append(book_title[loop]).append("');");
							
				
				    System.out.println(query.toString());
				
					st.executeUpdate(query.toString());
					
			     }
					st.close();
					con.close();
				
					response.setContentType("text/xml");
	 				response.setHeader("Cache-Control","no-cache");
	 				response.setHeader("pragma","no-cache");
	 				response.setDateHeader("Expires",0);
	 	
	 	
	 	
	 				response.getWriter().write("Successfully Executed");
	 				response.getWriter().flush();
			
			
				
				//RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/createaccount_success.jsp");
				//d.forward(request,response);
				}
				catch(Exception e)
				{
					e.printStackTrace();
					System.out.println(e);
				}
			}
}		