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
public class has_language {

    private int language_id;
    private int movie_id;
    private String path;
    private String language;

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getLanguage_id() {
        return language_id;
    }

    public void setLanguage_id(int language_id) {
        this.language_id = language_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    public static boolean isSamePath(String mname,int language_id){
        boolean b = false;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `movie_has_language` join movie on movie.movie_id = movie_has_language.movie_id WHERE movie.name = ? and movie_has_language.language_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, mname);
            pstm.setInt(2, language_id);
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                b = true;
            }
        } catch (Exception ex) {
            System.out.println("findPathByMovieName Exception: " + ex);
        }
        return  b;
    }

    public static void savePath(int movie_id, int language_id, String path) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `movie_has_language`(`movie_id`, `language_id`, `path`) VALUES (?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            pstm.setInt(2, language_id);
            pstm.setString(3, path);
            x = pstm.executeUpdate();
        } catch (Exception ex) {
            System.out.println("savePath Exception: " + ex);
        }
    }
    
    public static void updatePath(int movie_id, int language_id, String path) {
        int x= 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `movie_has_language` SET `path`=? where `movie_id`=? and `language_id`=?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, path);
            pstm.setInt(2, movie_id);
            pstm.setInt(3, language_id);
            x = pstm.executeUpdate();
        } catch (Exception ex) {
            System.out.println("updatePath Exception: " + ex);
        }
    }
    
    public static List<has_language> getAllLanguage(int movie_id){
        List<has_language> hl_list = null;
        has_language hl = null;
        try{
            Connection con = ConnectionBuilder.getConnection();
            String s  = "SELECT mhl.*,l.language FROM `movie_has_language` mhl JOIN movie m on m.movie_id = mhl.movie_id JOIN language l ON l.language_id = mhl.language_id WHERE m.movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(hl_list == null){
                    hl_list = new ArrayList<>();
                }
                hl = new has_language();
                hl.setLanguage_id(rs.getInt("language_id"));
                hl.setMovie_id(rs.getInt("movie_id"));
                hl.setPath(rs.getString("path"));
                hl.setLanguage(rs.getString("language"));
                hl_list.add(hl);
            }
            con.close();
        }catch(Exception ex){
            System.out.println("getAllLanguage error: "+ex);
        }
        return hl_list;
    }
    
    

    @Override
    public String toString() {
        return "has_language{" + "language_id=" + language_id + ", movie_id=" + movie_id + ", path=" + path + ", language=" + language + '}';
    }
    
    public static void main(String[] args) {
//        if(isSamePath("Agoraphobia", 1)==true){
//            System.out.println("path of this movie is same");
//        }else{
//            System.out.println("OKOKOK");
//        }
        updatePath(94, 1, "aaa.mp4");
    }

}
