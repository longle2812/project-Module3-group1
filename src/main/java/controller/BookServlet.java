package controller;

import model.Book;
import service.book.BookService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {
    BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                showCreateForm(request, response);
                break;
            }
            default: {
                showBookList(request, response);
                break;
            }
        }
    }

    private void showBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookService.findAll();
        Map<Integer, String> categoryList = bookService.getCategoryName();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/book/list.jsp");
        request.setAttribute("books", bookList);
        request.setAttribute("categories", categoryList);
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/book/create.jsp");
        Map<Integer, String> categoryList = bookService.getCategoryName();
        request.setAttribute("categories", categoryList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createNewBook(request,response);
                break;
            }
        }
    }

    private void createNewBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imgURL = request.getParameter("imgURL");
        String status = request.getParameter("status");
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        String publisher = request.getParameter("publisher");
        Book book = new Book(name,description,imgURL,status,category_id,publisher);
        RequestDispatcher requestDispatcher;
        if(!bookService.createNew(book)){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("message", "New book added");
            requestDispatcher = request.getRequestDispatcher("/book/create.jsp");
        }
        requestDispatcher.forward(request, response);
    }

}
