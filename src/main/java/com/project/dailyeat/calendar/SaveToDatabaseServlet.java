package com.project.dailyeat.calendar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet("/saveToDatabase")
public class SaveToDatabaseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        List<MenuDTO> foodList = (List<MenuDTO>) session.getAttribute("foodList");

        if (foodList != null) {
            Connection conn = null;
            PreparedStatement psmt = null;

            try {
                // 데이터베이스 연결 설정
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@10.100.103.31:1521:xe", "scott", "tiger");

                String query = "INSERT INTO project.menu (menu_num, id, postdate, menu, quantity, kcal, carbo, protein, fat, sugar, natrium, meal_type) " +
                        "VALUES (project.SEQ_MENU_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                psmt = conn.prepareStatement(query);

                for (MenuDTO food : foodList) {
                    psmt.setString(1, food.getId());
                    psmt.setString(2, food.getPostdate());
                    psmt.setString(3, food.getName());
                    psmt.setInt(4, food.getGram());
                    psmt.setInt(5, food.getCalories());
                    psmt.setInt(6, food.getCarbs());
                    psmt.setInt(7, food.getProtein());
                    psmt.setInt(8, food.getFat());
                    psmt.setInt(9, food.getSugar());
                    psmt.setInt(10, food.getNat());
                    psmt.setString(11, food.getMealType());
                    psmt.addBatch();
                }

                psmt.executeBatch();

                // 응답 반환
                PrintWriter out = response.getWriter();
                out.write("{\"status\":\"success\"}");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
                PrintWriter out = response.getWriter();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.write("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
                out.flush();
            } finally {
                if (psmt != null) try { psmt.close(); } catch (Exception e) { /* Ignore */ }
                if (conn != null) try { conn.close(); } catch (Exception e) { /* Ignore */ }
            }
        } else {
            PrintWriter out = response.getWriter();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.write("{\"status\":\"error\", \"message\":\"세션에 저장된 음식 정보가 없습니다.\"}");
            out.flush();
        }
    }
}

