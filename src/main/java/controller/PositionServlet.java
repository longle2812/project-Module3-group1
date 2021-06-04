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
            default:
                shelfMainMenu(request, response);
                break;
        }
    }

    private void showViewShelfForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        int shelfID = Integer.parseInt(request.getParameter("shelfID"));
        List<Book> bookList = this.bookService.findBookById(userID, shelfID);
        request.setAttribute("books", bookList);
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
            default:
                break;
        }
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
