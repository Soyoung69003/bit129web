package lunchbox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.action.MemberLoginAction;

/**
 * Servlet implementation class MemerFrontController
 */
@WebServlet("/member/*")
public class MemerFrontController extends HttpServlet implements Action {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		//needs connection pool??
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
	        String RequestURI=request.getRequestURI(); 
	        String contextPath=request.getContextPath(); 
	        String command = RequestURI.substring(contextPath.length()); 
	        ActionForward forward = null; 
	        Action action = null; 
	        
	        if(command.equals("/MemberLogin.me")){ 
	            forward=new ActionForward(); 
	            forward.setRedirect(false); 
	            forward.setPath("./member/loginForm.jsp"); 
	        }else if(command.equals("/MemberLoginAction.me")){ 
	            action=new MemberLoginAction(); 
	            try { 
	                forward=action.execute(request, response); 
	            } catch (Exception e) { 
	                e.printStackTrace(); 
	            } 
	        }else if(command.equals("/MemberJoin.me")){ 
	            forward = new ActionForward(); 
	            forward.setRedirect(false); 
	            forward.setPath("./member/joinForm.jsp"); 
	        }else if(command.equals("/MemberJoinAction.me")){ 
	            action=new MemberJoinAction(); 
	            try { 
	                forward=action.execute(request, response); 
	            } catch (Exception e) { 
	                e.printStackTrace(); 
	            } 
	        }else if(command.equals("/MemberListAction.me")){ 
	            action=new MemberListAction(); 
	            try { 
	                forward=action.execute(request, response); 
	            } catch (Exception e) { 
	                e.printStackTrace(); 
	            } 
	        }else if(command.equals("/MemberViewAction.me")){ 
	            action=new MemberViewAction(); 
	            try { 
	                forward=action.execute(request, response); 
	            } catch (Exception e) { 
	                e.printStackTrace(); 
	            } 
	        }else if(command.equals("/MemberDeleteAction.me")){ 
	            action=new MemberDeleteAction(); 
	            try { 
	                forward=action.execute(request, response); 
	            } catch (Exception e) { 
	                e.printStackTrace(); 
	            } 
	        } 
	        if(forward!=null){ 
	            if(forward.isRedirect()){ 
	                response.sendRedirect(forward.getPath()); 
	            }else{ 
	                RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath()); 
	                dispatcher.forward(request, response); 
	            } 
	        }         
	    }
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

 
}
