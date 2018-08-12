package tallerweb.sangucheto.controladores;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;

@Controller
public class ControladorArmar {
	/**
	 * Dirige a la pantalla de armar el sanguchetto, enviando <br>
	 * un {@code Sanguchetto} vacio, el {@code Stock} disponible en ese momento y el {@code Precio}
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(path="/armar")
	public ModelAndView armarSanguchetto() {
		Sanguchetto sanguchetto = Sanguchetto.getInstance();
		ModelMap modelo = new ModelMap();
		
		Stock stockDisponible = Stock.getInstance();
		
		modelo.put("stockIng", stockDisponible.listarIngredientesConStock());
		modelo.put("stockCond", stockDisponible.listarCondimentosConStock());
		modelo.put("miSanguchettoIng", sanguchetto.verIngredientes());
		modelo.put("miSanguchettoCond", sanguchetto.verCondimentos());
		
		Double precio = sanguchetto.getPrecio();
		modelo.put("precioSanguchetto", precio);
		
		Double descuento = sanguchetto.aplicarDescuento(precio, 0.15);
		modelo.put("descuento", descuento);
		
		modelo.put("precioDescontado", sanguchetto.descuentoTotal(precio, descuento));
		
		Boolean bandera = false;
		if(!sanguchetto.verCondimentos().isEmpty() || !sanguchetto.verIngredientes().isEmpty())
			bandera = true;
		
		modelo.put("bandera", bandera);
		return new ModelAndView("armar", modelo);
	}
	
	/**
	 * Busca y Agrega un Ingrediente/Condimento al Sanguchetto
	 * @param ingrediente
	 * @return
	 */
	@RequestMapping(value="/agregarIngrediente", method=RequestMethod.GET)
	public ModelAndView agregarIngrediente(@RequestParam String ingrediente) {
		Stock stock = Stock.getInstance();
		Sanguchetto sanguchetto = Sanguchetto.getInstance();
		Ingrediente ingredienteSeleccionado = null;
		
		for (Ingrediente item : stock.listarIngredientesDisponibles()) {
			if(item.getNombre().equals(ingrediente))
				ingredienteSeleccionado = item;
		}
		
		sanguchetto.agregarIngrediente(ingredienteSeleccionado);
		
		stock.comprarIngrediente(ingredienteSeleccionado, new Integer(1));
		
		return new ModelAndView("redirect:armar");
	}
	
	
	/**
	 * Limpia todos los Ingredientes/Condimentos del Sanguchetto.
	 * @return
	 */
	@RequestMapping(value="/limpiarSanguchetto", method= RequestMethod.POST)
	public String limpiarSanguchetto() {
		Sanguchetto sanguchetto = Sanguchetto.getInstance();
		Stock stock = Stock.getInstance();
		List<Ingrediente> ingredientes = sanguchetto.verIngredientes();
		List<Ingrediente> condimentos = sanguchetto.verCondimentos();
		
		for (Ingrediente ingrediente : ingredientes) {
			if(stock.buscarIngrediente(ingrediente) != null)
				stock.agregarStock(ingrediente, 1);
		}
		
		for (Ingrediente condimento : condimentos) {
			if(stock.buscarIngrediente(condimento) != null)
				stock.agregarStock(condimento, 1);
		}
		
		sanguchetto.vaciar();
		
		return "redirect:armar";
	}
	
	/**
	 * Elimina un Ingrediente/Condimento del Sanguchetto.
	 * @param ingrediente
	 * @return
	 */
	@RequestMapping(value="/eliminarIngrediente", method= RequestMethod.GET)
	public String eliminarIngrediente(@RequestParam String ingrediente) {
		Stock stock = Stock.getInstance();
		Sanguchetto sanguchetto = Sanguchetto.getInstance();
		Ingrediente ingredienteSeleccionado = null;
		
		for (Ingrediente item : stock.listarIngredientesDisponibles()) {
			if(item.getNombre().equals(ingrediente)) {
				ingredienteSeleccionado = item;
				sanguchetto.eliminarIngrediente(ingredienteSeleccionado);
				break;
			}
		}
		
		stock.agregarStock(ingredienteSeleccionado, 1);
		return "redirect:armar";
	}
	
	/**
	 * [Temporal] - Redirige a la pantalla de agradecimiento.
	 * @return
	 */
	@RequestMapping(value="/disfrutaSanguchetto", method= RequestMethod.POST)
	public ModelAndView okSanguchetto() {
		Sanguchetto sanguchetto = Sanguchetto.getInstance();
		
		sanguchetto.vaciar();
		return new ModelAndView("exit");
	}
	
}
