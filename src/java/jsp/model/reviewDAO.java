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
public class reviewDAO {
    private int noOfRecords;
    
    public reviewDAO() { }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
     
    public int getNoOfRecords() {
        return noOfRecords;
    }
    
    public List<review> findByName(String name,int offset,int noOfRecords){
        List<review> lr = null;
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from review WHERE lower(name) like ? ORDER BY review_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + name.toLowerCase() + "%");
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lr == null) {
                    lr = new ArrayList<>();
                }
                r = new review();
                r.setMovie_id(rs.getInt("movie_id"));
                r.setName(rs.getString("name"));
                r.setDescription(rs.getString("description"));
                r.setPostdate(rs.getTimestamp("postdate"));
                r.setReview_id(rs.getInt("review_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRating(rs.getInt("rating"));
                lr.add(r);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lr;
    }
    
    public List<review> viewAllReview(int offset,int noOfRecords){
        List<review> lr = null;
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from review WHERE postdate < CURRENT_TIMESTAMP ORDER BY review_id DESC limit ?,? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, offset);
            pstm.setInt(2, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lr == null) {
                    lr = new ArrayList<>();
                }
                r = new review();
                r.setMovie_id(rs.getInt("movie_id"));
                r.setName(rs.getString("name"));
                r.setDescription(rs.getString("description"));
                r.setPostdate(rs.getTimestamp("postdate"));
                r.setReview_id(rs.getInt("review_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRating(rs.getInt("rating"));
                lr.add(r);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lr;
    }
}
