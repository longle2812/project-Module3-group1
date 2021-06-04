package model;

public class User {
    private int id;
    private String email;
    private String password;
    private String name;
    private String dOb;
    private String phoneNumber;
    private String avatarURL;

    public User(int id, String email, String password, String name, String dob, String phoneNumber, String avatarURL) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.dOb = dob;
        this.phoneNumber = phoneNumber;
        this.avatarURL = avatarURL;
    }

    public User(String email, String password, String name, String dOb, String phoneNumber) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.dOb = dOb;
        this.phoneNumber = phoneNumber;
    }

    public User(String email, String password, String name, String dOb, String phoneNumber, String avatarURL) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.dOb = dOb;
        this.phoneNumber = phoneNumber;
        this.avatarURL = avatarURL;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdOb() {
        return dOb;
    }

    public void setdOb(String dOb) {
        this.dOb = dOb;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatarURL() {
        return avatarURL;
    }

    public void setAvatarURL(String avatarURL) {
        this.avatarURL = avatarURL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
