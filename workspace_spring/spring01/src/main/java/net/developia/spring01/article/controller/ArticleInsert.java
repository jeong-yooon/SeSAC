package net.developia.spring01.article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import net.developia.spring01.article.dto.ArticleDTO;
import net.developia.spring01.article.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleInsert {
	@Autowired
	ArticleService service;
	
	@GetMapping("/insert")
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("article/insert");
	}

	@PostMapping("/insertAction")
	public ModelAndView insertAction(HttpServletRequest request, HttpServletResponse response) {
		String name      = request.getParameter("name");
		String title     = request.getParameter("title");
		String password  = request.getParameter("password");
		String content   = request.getParameter("content");
		
		ArticleDTO articleDTO = new ArticleDTO();
		articleDTO.setName(name);
		articleDTO.setTitle(title);
		articleDTO.setPassword(password);
		articleDTO.setContent(content);
		
		try {
			service.insertArticle(articleDTO);
			return new ModelAndView("redirect:list");
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("article/result");
			mav.addObject("msg", "게시물 입력 실패\\n입력 폼으로 되돌아갑니다.");
			mav.addObject("url", "javascript:history.back();");
			return mav;
		}
	}

}

