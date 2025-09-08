package com.visitorlogbook.dao;

import com.visitorlogbook.model.Visitor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VisitorDAO {

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/visitorlogbook", "root", "novin");
    }

    // Add Visitor
    public boolean addVisitor(Visitor visitor) {
        boolean success = false;
        String sql = "INSERT INTO visitors (name, mobile, person_to_meet, visit_date, checkin_time) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, visitor.getName());
            ps.setString(2, visitor.getMobile());
            ps.setString(3, visitor.getPersonToMeet());
            ps.setDate(4, Date.valueOf(visitor.getVisitDate()));
            ps.setTime(5, Time.valueOf(visitor.getCheckinTime()));
            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Delete Visitor
    public boolean deleteVisitor(int id) {
        boolean success = false;
        String sql = "DELETE FROM visitors WHERE id=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Get Today Visitors
    public List<Visitor> getTodaysVisitors() {
        List<Visitor> list = new ArrayList<>();
        String sql = "SELECT * FROM visitors WHERE visit_date = CURDATE()";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setMobile(rs.getString("mobile"));
                v.setPersonToMeet(rs.getString("person_to_meet"));
                v.setVisitDate(rs.getDate("visit_date").toLocalDate());
                v.setCheckinTime(rs.getTime("checkin_time").toLocalTime());
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🔎 Search Today's Visitors by name or mobile
    public List<Visitor> searchTodaysVisitors(String keyword) {
        List<Visitor> list = new ArrayList<>();
        String sql = "SELECT * FROM visitors WHERE visit_date = CURDATE() AND (name LIKE ? OR mobile LIKE ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Visitor v = new Visitor();
                    v.setId(rs.getInt("id"));
                    v.setName(rs.getString("name"));
                    v.setMobile(rs.getString("mobile"));
                    v.setPersonToMeet(rs.getString("person_to_meet"));
                    v.setVisitDate(rs.getDate("visit_date").toLocalDate());
                    v.setCheckinTime(rs.getTime("checkin_time").toLocalTime());
                    list.add(v);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get Week Visitors (last 7 days)
    public List<Visitor> getWeekVisitors() {
        List<Visitor> list = new ArrayList<>();
        String sql = "SELECT * FROM visitors WHERE visit_date >= CURDATE() - INTERVAL 6 DAY";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setMobile(rs.getString("mobile"));
                v.setPersonToMeet(rs.getString("person_to_meet"));
                v.setVisitDate(rs.getDate("visit_date").toLocalDate());
                v.setCheckinTime(rs.getTime("checkin_time").toLocalTime());
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
