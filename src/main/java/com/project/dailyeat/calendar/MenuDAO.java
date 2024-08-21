//package com.project.dailyeat.calendar;
//
//import com.project.dailyeat.common.DBConnPool;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class MenuDAO extends DBConnPool{
//    public MenuDAO() {
//        super();
//    }
//
//    public boolean addMenu(MenuDTO dto) {
//        String query = "INSERT INTO project_menu (menu_num, id, postdate, menu, quantity, kcal, carbo, protein, fat, sugar, natrium, meal_type) " +
//                "VALUES (project.SEQ_MENU_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//        try {
//            PreparedStatement psmt = conn.prepareStatement(query);
//
//            psmt.setString(1, dto.getId());
//            psmt.setString(2, dto.getPostdate());
//            psmt.setString(3, dto.getMenu());
//            psmt.setInt(4, dto.getQuantity());
//            psmt.setInt(5, dto.getKcal());
//            psmt.setInt(6, dto.getCarbo());
//            psmt.setInt(7, dto.getProtein());
//            psmt.setInt(8, dto.getFat());
//            psmt.setInt(9, dto.getSugar());
//            psmt.setInt(10, dto.getNatrium());
//            psmt.setString(11, dto.getMealType());
//
//            int rowsAffected = psmt.executeUpdate();
//            return rowsAffected > 0;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//
//}
