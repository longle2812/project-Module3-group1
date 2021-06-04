package model;

public class Position {
    private int id;
    private String name;
    private String description;
    private int capacity;
    private int using;
    private int userID;

    public Position(int id, String name, String description, int inUse, int capacity) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.using = inUse;
        this.capacity = capacity;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Position(String name, String description, int capacity, int userID) {
        this.name = name;
        this.description = description;
        this.capacity = capacity;
        this.userID = userID;
    }


    public Position() {
    }

    public Position(String name, String description, int capacity) {
        this.name = name;
        this.description = description;
        this.capacity = capacity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getUsing() {
        return using;
    }

    public void setUsing(int using) {
        this.using = using;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
