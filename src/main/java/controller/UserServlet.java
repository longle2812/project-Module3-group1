package controller;

import model.User;
import service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/userServlet")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signUp":
                showSignUpForm(request, response);
                break;
            case "changePassword":
                changePasswordForm(request, response);
                break;
            default:
                showMainMenu(request, response);
                break;
        }
    }

    private void changePasswordForm(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        User user = this.userService.findUserByEmail(email);
        try {
            request.setAttribute("user", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user/changePassword.jsp");
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signUp":
                createNewUser(request, response);
                break;
            case "signIn":
                signIn(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
            default:
                break;
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        User user = this.userService.findUserByEmail(email);
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        if (password.equals(confirmPassword)){
            if (this.userService.changePassword(user, password)){
                request.setAttribute("message", "Success");
            }
        }
        else {
            request.setAttribute("message", "Password mismatch");
        }
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/changePassword.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isSuccess = this.userService.signIn(email, password);

        if (isSuccess) {
            User user = this.userService.findUserByEmail(email);
            request.setAttribute("user", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/userProfile.jsp");
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Fail");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String phoneNumber = request.getParameter("phoneNumber");
        String emailRegex = "^(.*?)+@(.*?)(\\.(.*?))+$";
        String passwordRegex = ".{6,}";
        User user = new User(email, password, name, dob, phoneNumber);
        if (!email.matches(emailRegex)) {
            request.setAttribute("emailErr", true);
        }
        if (!password.matches(passwordRegex)) {
            request.setAttribute("passErr", true);
        }
        if (email.matches(emailRegex) && password.matches(passwordRegex)){
            if (this.userService.createNew(user)) {
                request.setAttribute("message", "Success");
            }
            else request.setAttribute("message", "Error");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/signUp.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showSignUpForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/signUp.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showMainMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);
    }
}
