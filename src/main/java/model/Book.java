package model;

public class Book {
    private String name;
    private String description;
    private String imageURL;
    private String status;
    private String type;
    private String publisher;
    private int position;

    public Book() {
    }

    public Book(String name, String description, String imageURL, String status, String type, String publisher, int position) {
        this.name = name;
        this.description = description;
        this.imageURL = imageURL;
        this.status = status;
        this.type = type;
        this.publisher = publisher;
        this.position = position;
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

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}
