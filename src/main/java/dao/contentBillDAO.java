package dao;

import database.JDBIConnector;
import model.contentBill;
import org.jdbi.v3.core.Handle;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class contentBillDAO {
    private static Handle handle = JDBIConnector.getConnect().open();

    public contentBillDAO() {

    }

    public static List<contentBill> getAllCBByTypeBillID(int type) {
        List<contentBill> result = new ArrayList<>();
        result = handle.select("SELECT * FROM contentBill WHERE typeBillId = ?").bind(0, type).mapToBean(contentBill.class).collect(Collectors.toList());
        return result;
    }

    public static List<Integer> getAllCBIdByTypeBillID(int type) {
        List<Integer> result = new ArrayList<>();
        result = handle.select("SELECT id FROM contentBill WHERE typeBillId = ?").bind(0, type).mapTo(Integer.class).collect(Collectors.toList());
        return result;
    }

    public static contentBill getCTById(int id) {
        contentBill result = handle.createQuery("SELECT * FROM contentBill WHERE id = :id")
                .bind("id", id)
                .mapToBean(contentBill.class)
                .findOne()
                .orElse(null);  // Trả về null nếu không tìm thấy kết quả
        return result;
    }



    public static void main(String[] args) {
        System.out.println(333);
        System.out.println(getAllCBIdByTypeBillID(2).contains(9));

    }
}
