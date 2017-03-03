/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author Reawpai
 */
public class confirm_order {
    private int confirm_id;
    private int order_id;
    private double amount;
    private String bank;
    private String datetransfer;

    public String getDatetransfer() {
        return datetransfer;
    }

    public void setDatetransfer(String datetransfer) {
        this.datetransfer = datetransfer;
    }
    
    public int getConfirm_id() {
        return confirm_id;
    }

    public void setConfirm_id(int confirm_id) {
        this.confirm_id = confirm_id;
    }

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

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }
    
    public static confirm_order findByOrderId(int order_id){
        confirm_order co = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select co.* from confirm_order co join user_order uo on co.order_id = uo.order_id where uo.order_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                co = new confirm_order();
                co.setConfirm_id(rs.getInt("confirm_id"));
                co.setOrder_id(rs.getInt("order_id"));
                co.setAmount(rs.getDouble("amount"));
                co.setBank(rs.getString("Bank"));
                co.setDatetransfer(rs.getString("datetransfer"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("findByOrderId error: " + ex);
        }
        return co;
    }
    
    public static void addConfirm_order(double amount,String bank, int order_id,String datetransfer){
        int x =0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `confirm_order`(`order_id`, `amount`, `bank`, datetransfer) VALUES (?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, order_id);
            pstm.setDouble(2, amount);
            pstm.setString(3, bank);
            pstm.setString(4, datetransfer);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("findByOrderId error: " + ex);
        }
    }
    
}
