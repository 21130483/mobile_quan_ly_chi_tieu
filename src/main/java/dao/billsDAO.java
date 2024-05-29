package dao;

import database.JDBIConnector;
import model.bills;
import model.contentBill;
import model.user;
import org.jdbi.v3.core.Handle;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class billsDAO {
    private static Handle handle = JDBIConnector.getConnect().open();

    public billsDAO() {

    }

    public boolean addBill(int userId, int contentBillId, int money, String date) {
        boolean check = handle.execute("INSERT INTO bills (`userId`, `contentBillId`, `money`, `date`) VALUE(?,?,?,?)",userId,contentBillId,money,date) > 0;
        return check;
    }

    public static List<LocalDate> getBillDatesByuserId(int userId) {
        List<LocalDate> billsList = handle.select("SELECT DISTINCT date FROM bills WHERE userId = ?").bind(0,userId).mapTo(LocalDate.class).list();
        return billsList;
    }

    public static List<bills> getBillsByuserIdAndDate(int userId, LocalDate date) {
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ? AND date = ?").bind(0,userId).bind(1,date).mapToBean(bills.class).collect(Collectors.toList());
        return billsList;
    }

    public static int getTongByUserId(int userId) {
        contentBillDAO contentBillDAO = new contentBillDAO();
        List<Integer> plus = contentBillDAO.getAllCBIdByTypeBillID(2);
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ?").bind(0,userId).mapToBean(bills.class).collect(Collectors.toList());
        int total = 0;
        for (bills bill : billsList) {
            System.out.println(bill.getContentBillId());
            if (plus.contains(bill.getContentBillId())) {
                total+=bill.getMoney();
            }else{
                total-=bill.getMoney();
            }
        }
        return total;
    }

    public static int getPlusByUserId(int userId) {
        contentBillDAO contentBillDAO = new contentBillDAO();
        List<Integer> plus = contentBillDAO.getAllCBIdByTypeBillID(2);
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ?").bind(0,userId).mapToBean(bills.class).collect(Collectors.toList());
        int total = 0;
        for (bills bill : billsList) {
            if (plus.contains((Integer) bill.getContentBillId())) {
                total+=bill.getMoney();
            }
        }
        return total;
    }

    public static int getPlusByUserIdAndDate(int userId, LocalDate date) {
        contentBillDAO contentBillDAO = new contentBillDAO();
        List<Integer> plus = contentBillDAO.getAllCBIdByTypeBillID(2);
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ? AND date = ?").bind(0,userId).bind(1,date).mapToBean(bills.class).collect(Collectors.toList());
        int total = 0;
        for (bills bill : billsList) {
            if (plus.contains((Integer) bill.getContentBillId())) {
                total+=bill.getMoney();
            }
        }
        return total;
    }

    public static int getMinusByUserId(int userId) {
        contentBillDAO contentBillDAO = new contentBillDAO();
        List<Integer> plus = contentBillDAO.getAllCBIdByTypeBillID(2);
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ?").bind(0,userId).mapToBean(bills.class).collect(Collectors.toList());
        int total = 0;
        for (bills bill : billsList) {

            if (!plus.contains(bill.getContentBillId())) {
                total+=bill.getMoney();
            }
        }
        return total;
    }

    public static int getMinusByUserIdAndDate(int userId, LocalDate date) {
        contentBillDAO contentBillDAO = new contentBillDAO();
        List<Integer> plus = contentBillDAO.getAllCBIdByTypeBillID(2);
        List<bills> billsList = handle.select("SELECT * FROM bills WHERE userId = ? AND date = ?").bind(0,userId).bind(1,date).mapToBean(bills.class).collect(Collectors.toList());
        int total = 0;
        for (bills bill : billsList) {

            if (!plus.contains(bill.getContentBillId())) {
                total+=bill.getMoney();
            }
        }
        return total;
    }

    public static String formatLocalDate(LocalDate date) {
        DateTimeFormatter dayMonthFormatter = DateTimeFormatter.ofPattern("d/M");
        String dayMonth = date.format(dayMonthFormatter);

        String month = date.getMonth().getDisplayName(TextStyle.SHORT, new Locale("vi"));
        month = month.substring(0, 1).toUpperCase() + month.substring(1);  // Capitalize the first letter
        return String.format("%s, %s", month, dayMonth);
    }

    public static void main(String[] args) {
        System.out.println(getMinusByUserIdAndDate(1,getBillDatesByuserId(1).get(0)));


    }
}
