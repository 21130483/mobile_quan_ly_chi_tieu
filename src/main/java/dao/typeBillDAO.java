package dao;

import database.JDBIConnector;
import model.contentBill;
import model.typeBill;
import org.jdbi.v3.core.Handle;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class typeBillDAO {
    private static Handle handle = JDBIConnector.getConnect().open();

    public typeBillDAO() {

    }

    public static List<typeBill> getALl() {
        List<typeBill> result = new ArrayList<>();
        result = handle.select("SELECT * FROM typeBill").mapToBean(typeBill.class).collect(Collectors.toList());
        return result;
    }

    public static void main(String[] args) {
        LocalDate today = LocalDate.now();
        System.out.println(today);
    }
}
