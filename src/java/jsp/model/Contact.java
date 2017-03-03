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
public class Contact {
    private int contact_id;
    private String name;
    private String email;
    private String phone;
    private String message;
    private Timestamp datecreate;
    private int user_id;

    public int getContact_id() {
        return contact_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDatecreate() {
        return datecreate;
    }

    public void setDatecreate(Timestamp datecreate) {
        this.datecreate = datecreate;
    }
    
    public static Contact findById(int contact_id){
        Contact c =null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from contact where contact_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, contact_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                c = new Contact();
                c.setContact_id(rs.getInt("contact_id"));
                c.setDatecreate(rs.getTimestamp("datecreate"));
                c.setEmail(rs.getString("email"));
                c.setMessage(rs.getString("message"));
                c.setName(rs.getString("name"));
                c.setPhone(rs.getString("phone"));
                c.setUser_id(rs.getInt("user_id"));
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findById contact  error "+ex);
        }
        return c;
    }
    
    public static List<Contact> findByName(String cname){
        List<Contact> lc = null;
        Contact c =null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from contact where lower(name) like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + cname.toLowerCase() + "%");
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
        }catch(Exception ex){
            System.out.println("findByName contact  error "+ex);
        }
        return lc;
    }
    
    public static void addContact(String name, String email, String phone, String message, int user_id){
        int x;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `contact`( `name`, `message`, `email`, `phone`, `datecreate`, `user_id`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, name);
            pstm.setString(2, message);
            pstm.setString(3, email);
            pstm.setString(4, phone);
            pstm.setTimestamp(5, new java.sql.Timestamp(new java.util.Date().getTime()));
            pstm.setInt(6, user_id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("addReview error: " + ex);
        }
    }
    
    public static void main(String[] args) {
        Contact.addContact("Reawpai", "you-noob@hotmail.co.th", "0897890539", "Noob", 1);
    }
}
