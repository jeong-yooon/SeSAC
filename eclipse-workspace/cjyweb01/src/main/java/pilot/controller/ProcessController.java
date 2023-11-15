package pilot.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.fx.AbstractController;
import mvc.fx.ModelAndView;

public class ProcessController extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String iam = "그래, 난 " + name + ".";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/pilot/process.jsp");
		mav.addObject("iam", iam);
		return mav;
	}

}
