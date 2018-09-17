import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class management extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		if(request.getParameter("add")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/add.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("issue_book")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/select_student.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("return_book")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/return_book.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("books_issued")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/books_issued.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("defoolters")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/defoolters.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("fine_recieved")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/fine_recieved.jsp");
			d.forward(request,response);
			return;
		}
		if(request.getParameter("search_books")!=null)
		{
			RequestDispatcher d=request.getRequestDispatcher("/WEB-INF/search_books.jsp");
			d.forward(request,response);
			return;
		}
	}
}