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
import java.util.Date;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class review {

    private int review_id;
    private String name;
    private String description;
    private Timestamp postdate;
    private int rating;
    private int user_id;
    private int movie_id;

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getPostdate() {
        return postdate;
    }

    public void setPostdate(Timestamp postdate) {
        this.postdate = postdate;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }
    
    public String getUsername(int id){
        return  User.findById(id).getUsername();
    }
    
    public String getMoviename(int id){
        return  Movie.findById(id).getName();
    }
    
    public String getImage(int id){
        return Movie.findById(id).getPoster();
    }
    
    
    
    public static review findById(int id){
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `review` WHERE `review_id` = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                r = new review();
                r.setMovie_id(rs.getInt("movie_id"));
                r.setName(rs.getString("name"));
                r.setDescription(rs.getString("description"));
                r.setPostdate(rs.getTimestamp("postdate"));
                r.setReview_id(rs.getInt("review_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRating(rs.getInt("rating"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Review findById error: " + ex);
        }
        return r;
    }
    
    public static review findById(int movie_id, int user_id){
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `review` WHERE `movie_id` = ? and user_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            pstm.setInt(2, user_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                r = new review();
                r.setMovie_id(rs.getInt("movie_id"));
                r.setName(rs.getString("name"));
                r.setDescription(rs.getString("description"));
                r.setPostdate(rs.getTimestamp("postdate"));
                r.setReview_id(rs.getInt("review_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRating(rs.getInt("rating"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Review findById error: " + ex);
        }
        return r;
    }
    
    public static review findByMovieId(int movie_id){
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `review` WHERE `movie_id` = ? ";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                r = new review();
                r.setMovie_id(rs.getInt("movie_id"));
                r.setName(rs.getString("name"));
                r.setDescription(rs.getString("description"));
                r.setPostdate(rs.getTimestamp("postdate"));
                r.setReview_id(rs.getInt("review_id"));
                r.setUser_id(rs.getInt("user_id"));
                r.setRating(rs.getInt("rating"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Review findById error: " + ex);
        }
        return r;
    }
    
    public static List<review> findByName(String name){
        List<review> lr = null;
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `review` WHERE `name` like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + name.toLowerCase() + "%");
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
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lr;
    }
    
    public static List<review> getShowReview(){
        List<review> lr = null;
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM review WHERE postdate < CURRENT_TIMESTAMP ORDER BY review_id DESC LIMIT 0,4;";
            PreparedStatement pstm = con.prepareStatement(s);
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
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lr;
    } 

    public static void addReview(String name, String description, int user_id, int movie_id, int rating) {
        int x;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `review`(`name`, `description`, `postdate`, `user_id`, `movie_id`, rating) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
            pstm.setInt(4, user_id);
            pstm.setInt(5, movie_id);
            pstm.setInt(6, rating);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("addReview error: " + ex);
        }
    }
    
    public static void updateReview(String name, String description, int rating,int review_id){
        int x;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `review` SET `name`=?,`description`=?,`rating`=? WHERE review_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, name);
            pstm.setString(2, description);
            pstm.setInt(3, rating);
            pstm.setInt(4, review_id);
            x = pstm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("updateReview error: " + ex);
        }
    }

    @Override
    public String toString() {
        return "review{" + "review_id=" + review_id + ", name=" + name + ", description=" + description + ", postdate=" + postdate + ", user_id=" + user_id + ", movie_id=" + movie_id + '}';
    }
    
    
    
    public static void main(String[] args) {
        List<review> lr = review.getShowReview();
        for(review r:lr){
            System.out.println(r.toString());
        }
    }
}
