import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class return_book extends HttpServlet
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
	 	   query.append("select issue_date,due_date,reader_id,trans_id,reader_name,reader_type,issued_by,status,remark from lib_issue_return_book");
	 	   query.append(" where accession_no=").append(accession_no);
	 	
	 		System.out.println(query);
	 	String issue_date="",due_date="",reader_id="",trans_id="",reader_name="",reader_type="",issued_by="",status="",remark="";

	 	rt=st.executeQuery(query.toString());
	 	System.out.println("eee");
	 	while(rt.next())
	 	{
	 		 
	 		 issue_date = rt.getString("issue_date");
	 		 due_date = rt.getString("due_date");
	 		 reader_id = rt.getString("reader_id");
	 		 trans_id = rt.getString("trans_id");
	 		 reader_name = rt.getString("reader_name");
	 		 System.out.println(reader_name);
	 		 reader_type = rt.getString("reader_type");
	 		 issued_by = rt.getString("issued_by");
	 		 status = rt.getString("status");
	 		 remark= rt.getString("remark");
	 	}
	 	rt.close();
	
	System.out.println("ccc");
	
	 		datatosend.append("<member>");
	 		
	 		datatosend.append("<issue_date>").append(issue_date).append("</issue_date>");
	 		datatosend.append("<due_date>").append(due_date).append("</due_date>");
	 		datatosend.append("<reader_id>").append(reader_id).append("</reader_id>");
	 		datatosend.append("<trans_id>").append(trans_id).append("</trans_id>");
	 		datatosend.append("<reader_name>").append(reader_name).append("</reader_name>");
	 		datatosend.append("<reader_type>").append(reader_type).append("</reader_type>");
	 		datatosend.append("<issued_by>").append(issued_by).append("</issued_by>");
	 		datatosend.append("<status>").append(status).append("</status>");
	 		datatosend.append("<remark>").append(remark).append("</remark>");
	 		datatosend.append("</member>");
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




public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException	 
{
	try
	{
		String trans_id=request.getParameter("trans_id");
		String return_date=request.getParameter("return_date");
		String days_delayed=request.getParameter("days_delayed");
		String fine_amount=request.getParameter("fine_amount");
		String fine_amount_paid=request.getParameter("fine_amount_paid");
		String remark=request.getParameter("remark");
		String receipt_no=request.getParameter("receipt_no");
		String issued_by=request.getParameter("issued_by");
		System.out.println(trans_id);
		System.out.println(return_date);
		Connection con=null;
		Statement st=null;
		ResultSet rt=null;
		   	
	 	Class.forName("com.mysql.jdbc.Driver");
	 	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/accountg1006","root","root");
	 	st=con.createStatement();
	 	
	 	
	 	StringBuffer query=new StringBuffer();
	 	query.append("update lib_issue_return_book set return_date='").append(return_date).append("',days_delayed=").append(days_delayed);
	 	query.append(",fine_amount=").append(fine_amount).append(",fine_amount_paid=").append(fine_amount_paid).append(",remark='").append(remark).append("',receipt_no='").append(receipt_no);
	 	query.append("',issued_by='").append(issued_by).append("',status=").append(2).append(" where trans_id=").append(trans_id);
	 	System.out.println(query);
	 	
	 	st.executeUpdate(query.toString());
	 	
	 	st.close();
	 	con.close();
	 	
	 	response.setContentType("text/xml");
	 	response.setHeader("Cache-Control","no-cache");
	 	response.setHeader("pragma","no-cache");
	 	response.setDateHeader("Expires",0);
	 	
	 	
	 	
	 	response.getWriter().write("Successfully Executed");
	 	response.getWriter().flush();
	 }
	 catch(Exception e)
	 {
	 	System.out.println(e);
	 	
	}
}
	
}

	