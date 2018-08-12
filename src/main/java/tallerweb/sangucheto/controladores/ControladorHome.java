package tallerweb.sangucheto.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ControladorHome {
	
	/**
	 * Redirige a la pagina principal
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(path="/")
	public ModelAndView irAHome(){		
		return new ModelAndView("home");
	}
}
