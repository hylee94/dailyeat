package com.project.dailyeat.mvcboard;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/mvcboard/loadReplies")
public class ViewContentList extends HttpServlet {

    private static final String BOARDNUM_PARAM = "boardnum";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // 게시판 번호 받아고기
        String boardnumStr = req.getParameter(BOARDNUM_PARAM);


        if (boardnumStr != null) {
            try {
                int boardnum = Integer.parseInt(boardnumStr);

                // 댓글 DAO 객체 생성
                ReplyDAO replyDAO = new ReplyDAO();

                // 댓글 목록 조회
                List<ReplyDTO> replies = replyDAO.selectReplies(boardnum);

                //댓글 목록을 request 객체에 저장
                req.setAttribute("replies", replies);

                // JSP 로 포워드
                req.getRequestDispatcher("/project/community/view.jsp").forward(req, resp);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid boardnum");
            }catch ( Exception e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,"An error occurred while loading replies");
            }
        }else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "boardnum is missing");
        }


    }
}
