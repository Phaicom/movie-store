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
public class wishlistDAO {
    private static int noOfRecords;
    
    public wishlistDAO() { }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    public List<wishlist> viewAllWishlist(int id,int offset,int noOfRecords){
        List<wishlist> lw = null;
        wishlist w = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from wishlist WHERE user_id = ? and datepost < CURRENT_TIMESTAMP order by datepost desc limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lw == null) {
                    lw = new ArrayList<>();
                }
                w = new wishlist();
                w.setMovie_id(rs.getInt("movie_id"));
                w.setUser_id(rs.getInt("user_id"));
                w.setDatepost(rs.getTimestamp("datepost"));
                lw.add(w);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lw;
    }
    
    public static List<wishlist> viewAllWishlist(int id,String category,int offset,int noOfRecords){
        List<wishlist> lw = null;
        wishlist w = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS w.* from wishlist w join movie m on w.movie_id = m.movie_id"
                    + " join categories c on m.category_id = c.category_id "
                    + " WHERE w.user_id = ? and c.name = ? and datepost < CURRENT_TIMESTAMP  order by w.datepost desc limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            pstm.setString(2, category);
            pstm.setInt(3, offset);
            pstm.setInt(4, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lw == null) {
                    lw = new ArrayList<>();
                }
                w = new wishlist();
                w.setMovie_id(rs.getInt("movie_id"));
                w.setUser_id(rs.getInt("user_id"));
                w.setDatepost(rs.getTimestamp("datepost"));
                lw.add(w);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                wishlistDAO.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lw;
    }
    
    public static void main(String[] args) {
        List<wishlist> lw = wishlistDAO.viewAllWishlist(1, "Action", 0, 5);
        for(wishlist w : lw){
            System.out.println(w.toString());
        }
    }
    
}
