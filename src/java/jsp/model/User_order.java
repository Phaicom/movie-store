/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class User_order {

    private int order_id;
    private double amount;
    private Timestamp date_create;
    private int confirm_no;
    private int user_id;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getDate_create() {
        return date_create;
    }

    public void setDate_create(Timestamp date_create) {
        this.date_create = date_create;
    }

    public int getConfirm_no() {
        return confirm_no;
    }

    public void setConfirm_no(int confirm_no) {
        this.confirm_no = confirm_no;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User getUser(int user_id) {
        return User.findById(user_id);
    }

    public Movie getMovie(int order_id) {
        return Movie.findById(order_movie.findById(order_id).getMovie_id());
    }

    public String getStatus() {
        String status = "";
        if (this.getConfirm_no() == 0) {
            status = "<span style='color: orangered;'>Pending..</span>";
        } else if (this.getConfirm_no() == 1) {
            status = "<span style='color: green;'>Complete</span>";
        } else {
            status = "<span style='color: #CCCC00;'>Confirm</span>";
        }
        return status;
    }

    public static double getProfit() {
        double d = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT sum(user_order.amount) as total_amount FROM `user_order` WHERE user_order.confirm_no = 1";
            PreparedStatement pstm = con.prepareStatement(s);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                d = rs.getDouble("total_amount");

            }
        } catch (Exception ex) {
            System.out.println("findAllOrder error: " + ex);
        }
        return d;
    }

    public static List<User_order> findById() {
        List<User_order> luo = null;
        User_order uo = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `user_order` order by confirm_no asc,order_id desc";
            PreparedStatement pstm = con.prepareStatement(s);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (luo == null) {
                    luo = new ArrayList<>();
                }
                uo = new User_order();
                uo.setOrder_id(rs.getInt("order_id"));
                uo.setAmount(rs.getDouble("amount"));
                uo.setConfirm_no(rs.getInt("confirm_no"));
                uo.setDate_create(rs.getTimestamp("date_create"));
                uo.setUser_id(rs.getInt("user_id"));
                luo.add(uo);
            }
        } catch (Exception ex) {
            System.out.println("findAllOrder error: " + ex);
        }
        return luo;
    }

    public static User_order findById(int order_id) {
        User_order uo = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `user_order` where order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                uo = new User_order();
                uo.setOrder_id(rs.getInt("order_id"));
                uo.setAmount(rs.getDouble("amount"));
                uo.setConfirm_no(rs.getInt("confirm_no"));
                uo.setDate_create(rs.getTimestamp("date_create"));
                uo.setUser_id(rs.getInt("user_id"));
            }
        } catch (Exception ex) {
            System.out.println("findAllOrder error: " + ex);
        }
        return uo;
    }

    public static void addOrder(Cart c, int user_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `user_order`(`amount`, `user_id`) VALUES (?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setDouble(1, c.getTotalPrice());
            pstm.setInt(2, user_id);
            x = pstm.executeUpdate();
            pstm.close();

            con.close();
        } catch (Exception ex) {
            System.out.println("addOrder error: " + ex);
        }
    }

    public static void deleteOrder(int order_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "DELETE FROM `user_order` where order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            x = pstm.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println("deleteOrder error: " + ex);
        }
    }

//    update movie_order
    public static void updateMovie_order(Cart c, int user_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
//            find order to add movie_order
            String s = "SELECT * FROM `user_order` WHERE user_id = ? and amount = ?  and date_create <= CURRENT_TIMESTAMP order by date_create desc";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setDouble(2, c.getTotalPrice());
            ResultSet rs = pstm.executeQuery();
            int order_id = 0;
            if (rs.next()) {
                order_id = rs.getInt("order_id");
            }
            pstm.close();

//            add order_movie
            for (order_movie om : c.getList()) {
                s = "INSERT INTO `order_movie`(`order_id`, `movie_id`, `qty`) VALUES (?,?,?)";
                pstm = con.prepareStatement(s);
                pstm.setInt(1, order_id);
                pstm.setInt(2, om.getMovie_id());
                pstm.setDouble(3, om.getQty());
                x = pstm.executeUpdate();
                pstm.close();
            }
        } catch (Exception ex) {
            System.out.println("updateMovie_order error: " + ex);
        }
    }

    public static void completeOrder(int order_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `user_order` SET `confirm_no`= ? WHERE order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, 1);
            pstm.setInt(2, order_id);
            x = pstm.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println("completeOrder error: " + ex);
        }
    }

    public static void updateStatus(int order_id, int status) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `user_order` SET `confirm_no`= ? WHERE order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, status);
            pstm.setInt(2, order_id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("updateStatus error: " + ex);
        }
    }

    @Override
    public String toString() {
        return "User_order{" + "order_id=" + order_id + ", amount=" + amount + ", date_create=" + date_create + ", confirm_no=" + confirm_no + ", user_id=" + user_id + '}';
    }

    public static void main(String[] args) {
        User_order.completeOrder(1);
    }
}
