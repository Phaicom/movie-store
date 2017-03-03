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
public class categories {
    private int category_id;
    private String name;

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public static categories findById(int id){
        categories c = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `categories` WHERE category_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                c = new categories();
                c.setCategory_id(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findById error: "+ex);
        }
        return c;
    }
    
    
    public static categories findByName(String cname){
        categories c = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `categories` WHERE name = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, cname);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                c = new categories();
                c.setCategory_id(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findByName error: "+ex);
        }
        return c;
    }
    
    public static List<categories> findByNameList(String cname){
        List<categories> lc = null;
        categories c = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `categories` WHERE lower(name) like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%"+cname.toLowerCase()+"%");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(lc == null){
                    lc = new ArrayList<>();
                }
                c = new categories();
                c.setCategory_id(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
                lc.add(c);
            }
            con.close();
        }catch(Exception ex){
            System.out.println("findByName error: "+ex);
        }
        return lc;
    }

    @Override
    public String toString() {
        return "categories{" + "category_id=" + category_id + ", name=" + name + '}';
    }
    
    
    
    
}
