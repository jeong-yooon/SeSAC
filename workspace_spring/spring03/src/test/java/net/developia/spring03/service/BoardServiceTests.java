package net.developia.spring03.service;


import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.developia.spring03.domain.BoardVO;
import net.developia.spring03.domain.Criteria;

@WebAppConfiguration
@RunWith(SpringRunner.class)
@ContextConfiguration("file:**/*-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("service 새로 작성하는 글");
		board.setContent("service 새로 작성하는 내용");
		board.setWriter("service newbie");
		
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	
	@Test
	public void testGetList() {
		log.info(service.getList());
		service.getList().forEach(board -> log.info(board));
		
//		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(17L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove(9L));
	}
	
	@Test
	public void testUpadte() {
		
		BoardVO board = service.get(10L);
		if( board == null ) {
			fail();
			return;	
		}
		board.setTitle("10번 service 제목 수정합니다");
		log.info("MODIFY RESULT : " + service.modify(board));
	}

}
