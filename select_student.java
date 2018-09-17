import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class select_student extends HttpServlet
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
			
      String name_to_search=request.getParameter("name_to_search");   		
      System.out.println(name_to_search);
      
      
                       Connection con=null;
                       Statement st=null;
                      ResultSet rt=null;
                
      Class.forName("com.mysql.jdbc.Driver"); 
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
      st=con.createStatement();
		
		
		String query="select formno,name,gname,section from fleb2017 where name like '"+name_to_search+"%'";	
		rt=st.executeQuery(query);
	
         while(rt.next())
    	{
	  	datatosend.append("<fleb2017>");
		datatosend.append("<formno>").append(rt.getInt("formno")).append("</formno>");
		datatosend.append("<name>").append(rt.getString("name")).append("</name>");
		datatosend.append("<gname>").append(rt.getString("gname")).append("</gname>");
		datatosend.append("<section>").append(rt.getString("section")).append("</section>");
		datatosend.append("</fleb2017>");
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
		       				/*if(request.getParameter("Submit")!=null)
							{
								RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/issue_book.jsp");
									d.forward(request,response);
									return;
							}*/
	                            

   }
catch(Exception e)
       {
           System.out.println(e);
         }   		
   }


	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException	 
	{
		try
		{
			System.out.println("Out2");	
		if(request.getParameter("issue_book")!=null)
			{
				RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/issue_book.jsp");
				d.forward(request,response);
				return;
			}
			System.out.println("Out3");
	 	}
	 	catch(Exception e)
	 	{
	 		System.out.println(e);
	 	
		}		
	}

}		