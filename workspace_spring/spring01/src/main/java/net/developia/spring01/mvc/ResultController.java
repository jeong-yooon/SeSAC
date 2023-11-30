package net.developia.spring01.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class ResultController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		int com = (int)(Math.random()*3)+1;   
		int you = Integer.parseInt(request.getParameter("you")); 
		String[] caption = {"scissors","rock","paper"};
		
		ModelAndView mav = new ModelAndView("/WEB-INF/game/result.jsp");
		mav.addObject("you", caption[you - 1]);
		mav.addObject("com", caption[com - 1]);
		mav.addObject("result", message(you, com));
		return mav;
	}

	private String message(int you, int com) {
		switch((you - com + 3)%3) {
		case 0: return "무승부입니다!";		
		case 1: return "당신의 승리입니다.";
		case 2: return "패배하였습니다..";
		default:return "....?....";
		}
	}

}
