package dao;

import database.JDBIConnector;
import org.jdbi.v3.core.Handle;

public class recurringBillsDAO {
    private static Handle handle = JDBIConnector.getConnect().open();

    public recurringBillsDAO() {

    }
}
