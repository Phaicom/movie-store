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
public class ContactDAO {
    private int noOfRecords;
    
    public ContactDAO() { }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    public List<Contact> viewAllContact(int offset,int noOfRecords){
        List<Contact> lc = null;
        Contact c =null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from contact ORDER BY contact_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, offset);
            pstm.setInt(2, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lc == null) {
                    lc = new ArrayList<>();
                }
                c = new Contact();
                c.setContact_id(rs.getInt("contact_id"));
                c.setDatecreate(rs.getTimestamp("datecreate"));
                c.setEmail(rs.getString("email"));
                c.setMessage(rs.getString("message"));
                c.setName(rs.getString("name"));
                c.setPhone(rs.getString("phone"));
                c.setUser_id(rs.getInt("user_id"));
                lc.add(c);
            }
            con.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie viewAllMovie error: " + ex);
        }
        return lc;
    }
}
