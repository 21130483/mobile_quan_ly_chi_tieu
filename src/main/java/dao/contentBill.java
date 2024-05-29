package dao;

import database.JDBIConnector;
import org.jdbi.v3.core.Handle;

public class contentBill {
    private static Handle handle = JDBIConnector.getConnect().open();

    public contentBill() {

    }
}
