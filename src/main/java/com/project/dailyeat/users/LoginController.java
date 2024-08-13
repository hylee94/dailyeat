package com.project.dailyeat.users;

import com.project.dailyeat.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String password = req.getParameter("password");

        LoginDTO dto = new LoginDTO();
        dto.setId(id);
        dto.setPassword(password);

        LoginDAO dao = new LoginDAO();
        boolean isChecked = dao.userLogin(dto); // 로그인 메서드를 수정하여 UserDTO 객체 반환

        if (isChecked) {
            // 로그인 성공 시 세션에 사용자 ID 저장
            HttpSession session = req.getSession();
            session.setAttribute("id", id);
            JSFunction.alertLocation(resp, "로그인에 성공했습니다.", req.getContextPath() + "/project/home/Home.jsp");
        } else {
            JSFunction.alertBack(resp, "로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
        }
    }
}
