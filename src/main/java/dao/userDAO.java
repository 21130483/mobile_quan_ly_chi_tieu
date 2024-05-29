package dao;

import database.JDBIConnector;
import model.user;
import org.jdbi.v3.core.Handle;

import java.util.List;
import java.util.stream.Collectors;


public class userDAO {

    private static Handle handle = JDBIConnector.getConnect().open();

    public userDAO() {

    }

    public user checkLogin(String username, String pass) {
        List<user> users = handle.select("SELECT * FROM user").mapToBean(user.class).collect(Collectors.toList());
        for (user u : users) {
            if (u.getUsername().equals(username)) {
                if (u.getPassword().equals(pass)) {
                    return u;
                }
            }
        }
        return null;
    }
}
