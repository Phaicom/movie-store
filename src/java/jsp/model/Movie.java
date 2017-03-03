/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsp.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Reawpai
 */
public class Movie {

    private int movie_id;
    private String name;
    private double price;
    private int category_id;
    private String description;
    private String regdate;
    private String releasedyear;
    private String totaltime;
    private String poster;
    private String trailer;
    private double totalrating;
    private categories categories;
    private List<has_language> hl_list;
    private List<movie_pic> mp_list;

    public double getTotalrating() {
        return totalrating;
    }

    public void setTotalrating(double totalrating) {
        this.totalrating = totalrating;
    }
    
    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getReleasedyear() {
        return releasedyear;
    }

    public void setReleasedyear(String releasedyear) {
        this.releasedyear = releasedyear;
    }

    public String getTotaltime() {
        return totaltime;
    }

    public void setTotaltime(String totaltime) {
        this.totaltime = totaltime;
    }

    public List<has_language> getHl_list(int id) {
        return has_language.getAllLanguage(id);
    }

    public void setHl_list(List<has_language> hl_list) {
        this.hl_list = hl_list;
    }

    public List<movie_pic> getMp_list(int id) {
        return movie_pic.getAllImage(id);
    }

    public void setMp_list(List<movie_pic> mp_list) {
        this.mp_list = mp_list;
    }

    public categories getCategory() {
        return categories.findById(this.category_id);
    }
    
    public static List<Movie> findByReviewName(String rname){
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select m.* from movie m join review r on r.movie_id = m.movie_id where lower(r.name) like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + rname.toLowerCase() + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                m.setTotalrating(rs.getInt("totalrating"));
                lm.add(m);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie findByReviewName error: " + ex);
        }
        return lm;
    } 

    public boolean isSameWishlist(int movie_id, int user_id) {
        boolean result;
        if (wishlist.findById(movie_id, user_id) != null) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public boolean isSameReview(int movie_id, int user_id) {
        boolean result;
        if (review.findById(movie_id, user_id) != null) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public boolean isSameFeature(int movie_id) {
        boolean result;
        if (movie_feature.findById(movie_id) != null) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public static Movie findById(int id) {
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from movie where movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                m.setTotalrating(rs.getInt("totalrating"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return m;
    }

    public static List<Movie> findByName(String mname) {
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * from movie where lower(name) like ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, "%" + mname.toLowerCase() + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                m.setTotalrating(rs.getInt("totalrating"));
                lm.add(m);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie FindByName error: " + ex);
        }
        return lm;
    }

    public static List<Movie> recenlyMovie() {
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT * FROM `movie` WHERE regdate < CURRENT_TIMESTAMP ORDER BY movie_id desc LIMIT 0,3";
            PreparedStatement pstm = con.prepareStatement(s);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                m.setTotalrating(rs.getInt("totalrating"));
                lm.add(m);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Movie recenlyMovie error: " + ex);
        }
        return lm;
    }

    public static void deleteMovie(int movie_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "DELETE FROM `movie` where movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setInt(1, movie_id);
            x = pstm.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println("deleteMovie error: " + ex);
        }
    }

    public String getMovieCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getPrice());
    }

    public static void addLanguage(String name, int language_cast, String path) {
        try {
            List<Movie> lm = Movie.findByName(name);
            for (Movie m : lm) {
                has_language.savePath(m.getMovie_id(), language_cast, path);
            }
        } catch (Exception ex) {
            System.out.println("addLanguage error: " + ex);
        }
    }

    public static void updateLanguage(String name, int language_cast, String path) {
        try {
            List<Movie> lm = Movie.findByName(name);
            for (Movie m : lm) {
                has_language.updatePath(m.getMovie_id(), language_cast, path);
            }
        } catch (Exception ex) {
            System.out.println("updateLanguage error: " + ex);
        }
    }

    public review isReview(int movie_id) {
        review r = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "select * FROM `review` r join movie m on r.movie_id = m.movie_id where m.movie_id = ?";
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
            System.out.println("isReview error: " + ex);
        }
        return r;
    }

    public static int saveMovie(String name, double price, String description, String poster, String releasedyear, String totaltime, int language, String path, int category_id, String trailer) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "INSERT INTO `movie`( `name`, `poster`, `price`, `description`, `regdate`, `releasedyear`, `totaltime`, `trailer`, `category_id`) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, name);
            pstm.setString(2, poster);
            pstm.setDouble(3, price);
            pstm.setString(4, description);
            pstm.setTimestamp(5, new java.sql.Timestamp(new java.util.Date().getTime()));
            pstm.setString(6, releasedyear);
            pstm.setString(7, totaltime);
            pstm.setString(8, trailer);
            pstm.setInt(9, category_id);
            x = pstm.executeUpdate();
            con.close();
            List<Movie> lm = Movie.findByName(name);
            for (Movie m : lm) {
                has_language.savePath(m.getMovie_id(), language, path);
            }

        } catch (Exception ex) {
            System.out.println("saveMovie error: " + ex);
        }
        return x;
    }

    public static int updateMovie(String name, double price, String description, String poster, String releasedyear, String totaltime, int category_id, String trailer, int movie_id) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `movie` SET `name`=?,`poster`=?,`price`=?,`description`=?,`releasedyear`=  ?,`totaltime`=?,`trailer`=?,`category_id`=? WHERE movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setString(1, name);
            pstm.setString(2, poster);
            pstm.setDouble(3, price);
            pstm.setString(4, description);;
            pstm.setDate(5, java.sql.Date.valueOf(releasedyear));
            pstm.setString(6, totaltime);
            pstm.setString(7, trailer);
            pstm.setInt(8, category_id);
            pstm.setInt(9, movie_id);
            x = pstm.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println("updateMovie error: " + ex);
        }
        return x;
    }
    
    public static int updateRating(int movie_id,double rating) {
        int x = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "UPDATE `movie` SET `totalrating`=? WHERE movie_id = ?";
            PreparedStatement pstm = con.prepareStatement(s);
            pstm.setDouble(1, rating);
            pstm.setInt(2, movie_id);
            x = pstm.executeUpdate();
            con.close();

        } catch (Exception ex) {
            System.out.println("updateRating error: " + ex);
        }
        return x;
    }

    public static List<Movie> getToptenMovie() {
        List<Movie> lm = null;
        Movie m = null;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String s = "SELECT movie.*\n"
                    + "FROM movie \n"
                    + "join order_movie on movie.movie_id = order_movie.movie_id \n"
                    + "join user_order on order_movie.order_id = user_order.order_id\n"
                    + "JOIN user ON user_order.user_id = user.user_id \n"
                    + "GROUP BY movie.name\n"
                    + "ORDER BY COUNT(movie.movie_id) desc\n"
                    + "LIMIT 0,10";
            PreparedStatement pstm = con.prepareStatement(s);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (lm == null) {
                    lm = new ArrayList<>();
                }
                m = new Movie();
                m.setName(rs.getString("name"));
                m.setMovie_id(rs.getInt("movie_id"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setRegdate(rs.getString("regdate"));
                m.setReleasedyear(rs.getString("releasedyear"));
                m.setTotaltime(rs.getString("totaltime"));
                m.setPoster((rs.getString("poster")));
                m.setTrailer((rs.getString("trailer")));
                m.setCategory_id(rs.getInt("category_id"));
                m.setTotalrating(rs.getInt("totalrating"));
                lm.add(m);
            }
        } catch (Exception ex) {
            System.out.println("getToptenMovie error: " + ex);
        }
        return lm;
    }

//    public int getIdByName(String name){
//        List<Movie> lm = Movie.findByName(name);
//        int count=0;
//        int movie_id = 0;
//        for(Movie m:lm){
//            count++;
//            if(count == 1){
//                movie_id = m.getMovie_id();
//            }
//        }
//        return movie_id ;
//    }
    @Override
    public String toString() {
        return "Movie{" + "movie_id=" + movie_id + ", name=" + name + ", price=" + price + ", description=" + description + ", regdate=" + regdate + ", releasedyear=" + releasedyear + ", totaltime=" + totaltime + ", poster=" + poster + '}';
    }

    public static void main(String[] args) {
       List<Movie> lm = Movie.findByReviewName("");
       for(Movie m:lm){
           System.out.println(m.toString());
       }
    }
}
