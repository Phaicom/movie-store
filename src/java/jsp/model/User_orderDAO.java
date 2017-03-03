/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class User_orderDAO {
    private static int noOfRecords;
    
    public User_orderDAO() { }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    public List<User_order> viewAllOrder(int offset,int noOfRecords){
        List<User_order> luo = null;
        User_order uo = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from user_order where date_create < CURRENT_TIMESTAMP order by confirm_no asc,date_create desc limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, offset);
            pstm.setInt(2, noOfRecords);
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
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return luo;
    }
    
    public List<User_order> viewAllOrder(int user_id,int offset,int noOfRecords){
        List<User_order> luo = null;
        User_order uo = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from user_order where date_create < CURRENT_TIMESTAMP and user_id = ? order by confirm_no asc,date_create desc limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, user_id);
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
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
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return luo;
    }
}
