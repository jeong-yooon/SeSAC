package game.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class ResultController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
        // Get user's choice
        int you = Integer.parseInt(request.getParameter("you"));

        // Generate a random choice for the computer
        int com = new Random().nextInt(3) + 1;

        // Determine the winner
        String result = determineWinner(you, com);

        // Set the result and choices as attributes
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/WEB-INF/game/result.jsp");
        mav.addObject("you", getChoiceString(you));
        mav.addObject("com", getChoiceString(com));
        mav.addObject("result", result);

        return mav;
	}
	
    private String determineWinner(int you, int com) {
        if (you == com) {
            return "비겼습니다!";
        } else if ((you == 1 && com == 3) || (you == 2 && com == 1) || (you == 3 && com == 2)) {
            return "당신이 이겼습니다!";
        } else {
            return "컴퓨터가 이겼습니다!";
        }
    }
	
    private String getChoiceString(int choice) {
        switch (choice) {
            case 1:
                return "가위";
            case 2:
                return "바위";
            case 3:
                return "보";
            default:
                return "";
        }
    }

}
