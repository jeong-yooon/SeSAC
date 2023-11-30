package net.developia.spring01.article.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.developia.spring01.article.dto.ArticleDTO;
import net.developia.spring01.article.service.ArticleService;

@Controller
@Slf4j
@AllArgsConstructor
public class ArticleList extends AbstractController {
	
	//ArticleService service = ArticleService.getInstance();
	@Autowired
	ArticleService service;
		
	@RequestMapping(value="/article/list", 
			method= {RequestMethod.GET, RequestMethod.POST})
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			List<ArticleDTO> list = service.getArticleList();
			return new ModelAndView("article/list", "list", list);
			
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView("/WEB-INF/views/article/result.jsp");
			mav.addObject("msg", "게시물 리스트 출력 실패");
			mav.addObject("url", "../");
			return mav;
		}
	}
}
