package model;

public class Position {
    private String name;
    private String description;
    private int available;
    private int using;

    public Position(String name, String description, int available, int using) {
        this.name = name;
        this.description = description;
        this.available = available;
        this.using = using;
    }

    public Position() {
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

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public int getUsing() {
        return using;
    }

    public void setUsing(int using) {
        this.using = using;
    }
}
