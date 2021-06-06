package controller;

import model.Book;
import model.Position;
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
    PositionServlet positionServlet = new PositionServlet();

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
            case "edit":{
                showEditForm(request, response);
                break;
            }
            case "delete":{
                deleteBook(request, response);
                break;
            }
            case "add":
                addToShelf(request, response);
                break;
            default: {
                showBookList(request, response);
                break;
            }
        }
    }

    private void addToShelf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int shelfId = Integer.parseInt(request.getParameter("shelfId"));
        if (this.bookService.addBookToShelf(userID, bookId, shelfId)){
            request.setAttribute("message", "success");
        }
        else  request.setAttribute("message", "error");
        showBookList(request, response);
    }

    private void searchBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameSearch");
        List<Book> bookList = bookService.searchByName(name);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/book/list.jsp");
        request.setAttribute("books",bookList);
        requestDispatcher.forward(request,response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.bookService.delete(id);
        response.sendRedirect("/books");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id =  Integer.parseInt(request.getParameter("id"));
        Map<Integer, String> categoryList = bookService.getCategoryName();
        Book book = bookService.findByID(id);
        RequestDispatcher requestDispatcher;
        if(book==null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else{
            requestDispatcher = request.getRequestDispatcher("/book/edit.jsp");
            request.setAttribute("book", book);
            request.setAttribute("categories", categoryList);
        }
        requestDispatcher.forward(request,response);
    }

    private void showBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        List<Position> positionList = this.positionServlet.positionService.findAllByID(userID);
        request.setAttribute("shelfList", positionList);
        String q = request.getParameter("q");
        List<Book> bookList;
        if(q==null || q.equals("")){
            bookList = bookService.findAll();
        }else{
            bookList = bookService.searchByName(q);
        }
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
            case "edit":{
                editBook(request, response);
                break;
            }
        }
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String imgURL = request.getParameter("imgURL");
        String status = request.getParameter("status");
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        String publisher = request.getParameter("publisher");
        Book book = new Book(name,description,imgURL,status,category_id,publisher);
        RequestDispatcher requestDispatcher;
        if(!bookService.update(id, book)){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("message", "Book was updated");
            requestDispatcher = request.getRequestDispatcher("/book/edit.jsp");
        }
        requestDispatcher.forward(request, response);
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
