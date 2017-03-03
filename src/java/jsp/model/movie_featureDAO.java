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
public class movie_featureDAO {
    private int noOfRecords;
    
    public movie_featureDAO() { }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    public List<movie_feature> viewAllFeature(int offset,int noOfRecords){
        List<movie_feature> lmf = null;
        movie_feature mf = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie_feature WHERE datepost < CURRENT_TIMESTAMP ORDER BY datepost DESC limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, offset);
            pstm.setInt(2, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lmf == null) {
                    lmf = new ArrayList<>();
                }
                mf = new movie_feature();
                mf.setMovie_id(rs.getInt("movie_id"));
                mf.setPic(rs.getString("pic"));
                mf.setDatepost(rs.getTimestamp("datepost"));
                lmf.add(mf);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lmf;
    }
    
    public List<movie_feature> viewAllFeature(int offset,int noOfRecords, String name){
        List<movie_feature> lmf = null;
        movie_feature mf = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie_feature mf join movie m on mf.movie_id = m.movie_id "
                    + "join categories c on m.category_id = c.category_id "
                    + "WHERE lower(m.name) like ? and mf.datepost < CURRENT_TIMESTAMP ORDER BY mf.datepost DESC limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + name.toLowerCase() + "%");
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lmf == null) {
                    lmf = new ArrayList<>();
                }
                mf = new movie_feature();
                mf.setMovie_id(rs.getInt("movie_id"));
                mf.setPic(rs.getString("pic"));
                mf.setDatepost(rs.getTimestamp("datepost"));
                lmf.add(mf);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lmf;
    }
    
    public List<movie_feature> viewAllFeature(double p1,double p2, int offset,int noOfRecords){
        List<movie_feature> lmf = null;
        movie_feature mf = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie_feature mf join movie m on mf.movie_id = m.movie_id "
                    + "join categories c on m.category_id = c.category_id "
                    + "WHERE m.price between ? and ? and mf.datepost < CURRENT_TIMESTAMP ORDER BY mf.datepost DESC limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setDouble(1, p1);
            pstm.setDouble(2, p2);
            pstm.setInt(3, offset);
            pstm.setInt(4, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lmf == null) {
                    lmf = new ArrayList<>();
                }
                mf = new movie_feature();
                mf.setMovie_id(rs.getInt("movie_id"));
                mf.setPic(rs.getString("pic"));
                mf.setDatepost(rs.getTimestamp("datepost"));
                lmf.add(mf);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lmf;
    }
    
    public List<movie_feature> viewAllFeature(String category, int offset,int noOfRecords){
        List<movie_feature> lmf = null;
        movie_feature mf = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select SQL_CALC_FOUND_ROWS * from movie_feature mf join movie m on mf.movie_id = m.movie_id "
                    + "join categories c on m.category_id = c.category_id "
                    + "WHERE c.name like ? and mf.datepost < CURRENT_TIMESTAMP ORDER BY mf.datepost DESC limit ?,?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, category);
            pstm.setInt(2, offset);
            pstm.setInt(3, noOfRecords);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lmf == null) {
                    lmf = new ArrayList<>();
                }
                mf = new movie_feature();
                mf.setMovie_id(rs.getInt("movie_id"));
                mf.setPic(rs.getString("pic"));
                mf.setDatepost(rs.getTimestamp("datepost"));
                lmf.add(mf);
            }
            rs.close();
            
            pstm = con.prepareStatement("SELECT FOUND_ROWS()");
            rs = pstm.executeQuery();
            if(rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lmf;
    }
    
}
