package beans;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String userName;
    private String password;
    private String address;

    public User() {

    }

    public User(String address) {

        this.address = address;
    }

    public User(String userName, String password) {

        this.userName = userName;
        this.password = password;

    }

    public User(int id, String userName, String password, String address) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.address = address;
    }

    public User(String userName, String password, String address) {
        this.userName = userName;
        this.password = password;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public void setId(int id) {
        this.id = id;
    }

}
