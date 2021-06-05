package controller;

import model.User;
import service.user.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/home")
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
            case "userMenu":
                showUserMenu(request, response);
            case "edit":
                showEditMenu(request, response);
            default:
                showLogin(request, response);
                break;
        }
    }

    private void showEditMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        User user = this.userService.findUserById(userID);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showUserMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        User user = this.userService.findUserById(userID);
        request.setAttribute("user", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/userProfile.jsp");
        requestDispatcher.forward(request,response);
    }

    private void changePasswordForm(HttpServletRequest request, HttpServletResponse response) {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        User user = this.userService.findUserById(userID);
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
            case "edit":
                editInformation(request, response);
            default:
                break;
        }
    }

    private void editInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        User user = this.userService.findUserById(userID);
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String phoneNumber = request.getParameter("phoneNumber");
        String avatarURL = request.getParameter("avatarURL");
        if (!name.equals("")){
            user.setName(name);
        }
        if (!dob.equals("")){
            user.setdOb(dob);
        }
        if (!phoneNumber.equals("")){
            user.setPhoneNumber(phoneNumber);
        }
        if (!avatarURL.equals("")){
            user.setAvatarURL(avatarURL);
        }
        if (this.userService.update(userID, user)){
            request.setAttribute("message", "Update success");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) {
        int userID = (Integer) request.getSession(false).getAttribute("userID");
        User user = this.userService.findUserById(userID);
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
        HttpSession session = request.getSession();
        if (isSuccess) {
            User user = this.userService.findUserByEmail(email);
            request.setAttribute("user", user);
            session.setAttribute("userID",user.getId());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/userProfile.jsp");
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Fail");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/loginMenu.jsp");
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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/signupMenu.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showSignUpForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/signupMenu.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/loginMenu.jsp");
        requestDispatcher.forward(request, response);
    }
}
