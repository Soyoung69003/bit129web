package lunchbox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.action.MemberDeleteAction;
import lunchbox.action.MemberJoinAction;
import lunchbox.action.MemberListAction;
import lunchbox.action.MemberLoginAction;
import lunchbox.action.MemberLogoutAction;

public class MemberFrontController extends HttpServlet implements Servlet{ 
    static final long serialVersionUID=1L; 
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
        String RequestURI=request.getRequestURI(); 
        String contextPath=request.getContextPath(); 
        String command = RequestURI.substring(contextPath.length()); 
        ActionForward forward = null; 
        Action action = null; 
        
        //로그인화면 요청이 들어오면
        if(command.equals("/MemberLogin.me")){ 
            forward=new ActionForward(); 
            forward.setRedirect(false); 
            forward.setPath("./loginForm.jsp"); 
        //로그인 시도가 들어오면
        }else if(command.equals("/MemberLoginAction.me")){ 
            action=new MemberLoginAction(); 
            try { 
                forward=action.execute(request, response); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            } 
         
          //로그아웃 시도가 들어오면
        }else if(command.equals("/MemberLogoutAction.me")){ 
            action=new MemberLogoutAction(); 
            try { 
                forward=action.execute(request, response); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            }   
            
         //회원가입화면 요청이 들어오면
        }else if(command.equals("/MemberJoin.me")){ 
            forward = new ActionForward(); 
            forward.setRedirect(false); 
            forward.setPath("./joinForm.jsp"); 
            
         //정보 입력 후 회원가입 버튼을 누르면
        }else if(command.equals("/MemberJoinAction.me")){ 
            action=new MemberJoinAction(); 
            try { 
                forward=action.execute(request, response); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            }

			// 회원목록 조회 버튼을 누르면 
            }else if(command.equals("/MemberListAction.me")){
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
            
            //해당회원 정보 보기를 누르면
			/*
			 * }else if(command.equals("/MemberViewAction.me")){ action=new
			 * MemberViewAction(); try { forward=action.execute(request, response); } catch
			 * (Exception e) { e.printStackTrace(); }
			 */
        
		//회원삭제 요청이 들어오면
        }else if(command.equals("/MemberDeleteAction.me")) { 
            action=new MemberDeleteAction(); 
            try { 
                forward=action.execute(request, response); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            } 
        } //if end
        
        if(forward!=null){ 
            if(forward.isRedirect()){ 
            	response.sendRedirect(forward.getPath()); 
            }else{ 
            	RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath()); 
                dispatcher.forward(request, response);
            } 
        }         
    } 
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
        doProcess(request, response); 
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
        doProcess(request, response); 
    } 
}

