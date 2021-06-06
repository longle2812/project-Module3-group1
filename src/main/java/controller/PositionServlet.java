package controller;

import model.Book;
import model.Position;
import service.book.BookService;
import service.position.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PositionServlet", value = "/shelves")
public class PositionServlet extends HttpServlet {
    PositionService positionService = new PositionService();
    BookService bookService = new BookService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateShelfForm(request, response);
                break;
            case "view":
                showViewShelfForm(request, response);
                break;
            case "edit":
                showEditShelfForm(request, response);
                break;
            case"delete":
                deleteShelf(request,response);
                break;
            case "deleteBook":
                deleteBook(request, response);
                break;
            default:
                shelfMainMenu(request, response);
                break;
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shelfId = Integer.parseInt(request.getParameter("shelfId"));
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        positionService.deleteBookFromShelf(shelfId, bookId);
        response.sendRedirect("shelves?action=view&shelfID="+shelfId);
    }

    private void deleteShelf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shelfId = Integer.parseInt(request.getParameter("id"));
        this.positionService.delete(shelfId);
        response.sendRedirect("/shelves");
    }

    private void showEditShelfForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shelfID = Integer.parseInt(request.getParameter("shelfID"));
        Position position = this.positionService.findShelfByID(shelfID);
        request.setAttribute("shelf", position);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/position/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showViewShelfForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        int shelfID = Integer.parseInt(request.getParameter("shelfID"));
        List<Book> bookList = this.bookService.findBookById(userID, shelfID);
        request.setAttribute("books", bookList);
        request.setAttribute("shelfId", shelfID);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("position/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateShelfForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("position/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void shelfMainMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        List<Position> positionList = this.positionService.findAllByID(userID);

        if (positionList != null) {
            request.setAttribute("positionList" , positionList);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("position/shelfMenu.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                addNewShelf(request, response);
                break;
            case"edit":
                editShelfInfo(request, response);
                break;
            default:
                break;
        }
    }

    private void editShelfInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shelfId = Integer.parseInt(request.getParameter("shelfId"));
        Position position = this.positionService.findShelfByID(shelfId);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String capacity = request.getParameter("capacity");
        RequestDispatcher requestDispatcher;
        if (!name.equals("")){
            position.setName(name);
        }
        if (!description.equals("")){
            position.setName(description);
        }
        if (!capacity.equals("")){
            position.setCapacity(Integer.parseInt(capacity));
        }
        if (this.positionService.update(shelfId, position)){
            request.setAttribute("message", "Edit success");
        }
        requestDispatcher = request.getRequestDispatcher("/position/create.jsp");
        requestDispatcher.forward(request, response);


    }

    private void addNewShelf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        Position position = new Position(name, description, capacity,userID);
        if (this.positionService.createNew(position)) {
            request.setAttribute("message", "New Shelf Added");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("position/create.jsp");
        requestDispatcher.forward(request, response);
    }

}
