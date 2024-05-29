package dao;

import database.JDBIConnector;
import org.jdbi.v3.core.Handle;

public class billsDAO {
    private static Handle handle = JDBIConnector.getConnect().open();

    public billsDAO() {

    }
}
