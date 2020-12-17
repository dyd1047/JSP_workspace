//기존의 jsp 가 담당하고 있었던 컨트롤러로서의 업무를 현재 클래스로 분리시키자!
//그래야 jsp는 순수한 디자인이 되기 때문에 유지보수시 교체까지 가능하다..
package movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Controller;

import movie.model.MovieAdvisor;

//MovieController를 Controller 자료형으로 정의하자!!
public class MovieController implements Controller{
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movie = request.getParameter("movie");
		
		//3단계: 알맞는 로직 객체에게 일을 시킨다.
		MovieAdvisor advisor = new MovieAdvisor();
		String msg = advisor.getAdvice(movie);
		
		//4단계: 클라이언트에게 전달할 결과를 저장해놓는다.
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
	}

	public String getViewPage() {
		return "/movie/movie_result.jsp";
	}
}
