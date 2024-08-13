package com.project.dailyeat.users;

import com.project.dailyeat.util.JSFunction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/users/SignUpController")
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doReq(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doReq(req, resp);
    }

    protected void doReq(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            SignUpDTO dto = new SignUpDTO();
            SignUpDAO dao = new SignUpDAO();

            //폼에 입력한 정보 가져옴
            dto.setId(req.getParameter("id"));
            //패스워드, 패스워드 확인을 비교하기 위해 변수에 저장
            String pass1 = req.getParameter("password1");
            String pass2 = req.getParameter("password2");
            dto.setPassword(pass1);

            dto.setNickname("nickname");
            dto.setEmail(req.getParameter("email"));

            if (pass1.equals(pass2)) {//패스워드, 패스워드 확인이 일치할 경우
                dao.insertUsers(dto);
                //컨트롤러에서 또 다른 컨트롤러 호출
            } else {
                JSFunction.alertBack(resp, "비밀번호가 일치하지 않습니다.");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
