package tallerweb.sangucheto.controladores;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.CargaStock;
import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
public class ControladorStock {
	/**
	 * Envia un objeto {@code Ingrediente} para ser cargado.
	 * @return
	 */
	@RequestMapping(value="/daralta", method = RequestMethod.GET)
	public ModelAndView darAlta(@RequestParam(value="", required=false) String flag){
		ModelMap model = new ModelMap();
		Ingrediente nuevoIngrediente = new Ingrediente();
		TipoIngrediente tipos;
		
		model.put("flag", flag);
		model.put("mi_ingrediente",nuevoIngrediente);
		
		tipos = nuevoIngrediente.getTipo();
		
		model.put("tipos", tipos);
		
		return new ModelAndView("daralta",model);
	}

	
	/**
	 * Devuelve el objeto {@code Ingrediente} ya cargado y lo agrega al {@code Stock}
	 * @param nuevoIngrediente
	 * @return
	 */
	@RequestMapping(value="/daralta2", method = RequestMethod.POST)
	public ModelAndView ingredienteSubmit(@ModelAttribute("mi_ingrediente") Ingrediente nuevoIngrediente){
		ModelMap nuevoModelo = new ModelMap();
		Stock miStock = Stock.getInstance();
		String flag = "";
		nuevoIngrediente.setNombre(nuevoIngrediente.getNombre().toUpperCase());
		
		
		for(Ingrediente ing : miStock.listarIngredientesDisponibles())
			if(ing.getNombre().equalsIgnoreCase(nuevoIngrediente.getNombre()))
					flag = "error";
		if(!(flag.equalsIgnoreCase("error"))){
			miStock.agregarIngrediente(nuevoIngrediente);
		}
		nuevoModelo.put("flag",flag);

		return new ModelAndView("redirect:daralta",nuevoModelo);
	}

	/**
	 * Se envia los ingredientes tengan o no stock.
	 * @return
	 */
	@RequestMapping(value="/agregarstock", method = RequestMethod.GET)
	public ModelAndView agregarStock(){
		ModelMap modelo = new ModelMap();
		Stock miStock = Stock.getInstance();
		CargaStock stockDeCarga = new CargaStock();
		
		HashSet<String> nombres = new HashSet<String>();
		for(Ingrediente ing : miStock.listarIngredientesDisponibles()){
			nombres.add(ing.getNombre().toUpperCase());
		}

		modelo.put("nombres", nombres);
		modelo.put("stock_carga", stockDeCarga);
		return new ModelAndView("agregarstock",modelo);
	}
	
	/**
	 * Actualiza el stock de Ingredientes 
	 * @param stockCarga
	 * @return
	 */
	@RequestMapping(value="/agregarstock2", method = RequestMethod.POST)
	public ModelAndView refrescarStock(@ModelAttribute("stock_carga") CargaStock stockCarga){
		Stock miStock = Stock.getInstance();
		for (Map.Entry<Ingrediente, Integer> actual : miStock.obtenerStock().entrySet()) {
			if(actual.getKey().getNombre().equalsIgnoreCase(stockCarga.getNombre())){
				int aux = Integer.sum(stockCarga.getCantidad(), actual.getValue());
				actual.setValue(Integer.valueOf(aux));
			}
		}
		return new ModelAndView("redirect:agregarstock");
	}
	
	/**
	 * Envia los Condimentos e Ingredientes disponibles para listarlo.
	 * @return
	 */
	@RequestMapping(value = "/ControlStock")
	public ModelAndView controlStock() {

		ModelMap model = new ModelMap();
		Stock miStock = Stock.getInstance();
		Set<Ingrediente> setIngredientes = new HashSet<Ingrediente>();
		Set<Ingrediente> setCondimentos = new HashSet<Ingrediente>();
		ArrayList<Integer> cantidadIng = new ArrayList<Integer>();
		ArrayList<Integer> cantidadCond = new ArrayList<Integer>();
		
		for (Map.Entry<Ingrediente, Integer> actual : miStock.obtenerStock().entrySet()) {
			if(actual.getKey().getTipo().equals(TipoIngrediente.CONDIMENTO)){
				setCondimentos.add(actual.getKey());
				cantidadCond.add(actual.getValue());
			}
			else{
				setIngredientes.add(actual.getKey());
				cantidadIng.add(actual.getValue());
			}
		}
		model.put("ingredientes", setIngredientes);
		model.put("condimentos", setCondimentos);
		model.put("cantidad_condimentos", cantidadCond);
		model.put("cantidad_ingredientes", cantidadIng);
		return new ModelAndView("ControlStock", model);
	}
	
	/**
	 * Envia un HashSet de String con los nombres de los ingredientes a la vista. <br/>
	 * Y llega a recibir con GET un mensaje si hay error.
	 * @param mensajeError
	 * @return
	 */
	@RequestMapping(value="/eliminar", method = RequestMethod.GET)
	public ModelAndView eliminar(@RequestParam(value="" , required=false)String mensajeError){
		ModelMap modelo = new ModelMap();
		Stock miStock = Stock.getInstance();
		CargaStock cargaStock = new CargaStock();
		HashSet<String> nombres = new HashSet<String>();
		for(Ingrediente ing : miStock.listarIngredientesDisponibles()){
			nombres.add(ing.getNombre());
		}
		modelo.put("mensajeError", mensajeError);
		modelo.put("listanombres", nombres);
		modelo.put("carga", cargaStock);
		return new ModelAndView("eliminar",modelo);
	}
	
	/**
	 * Elimina la cant. de stock indicado, si esta es mayor envia un mensaje de error.
	 * @param cargaStock
	 * @return
	 */
	@RequestMapping(value="/eliminar2", method = RequestMethod.POST)
	public ModelAndView eliminar2(@ModelAttribute("carga") CargaStock cargaStock){
		ModelMap modelo = new ModelMap();
		Stock miStock = Stock.getInstance();
		String mensajeError="";
		int aux = 0;
		for (Map.Entry<Ingrediente, Integer> actual : miStock.obtenerStock().entrySet()) {
			if(actual.getKey().getNombre().equalsIgnoreCase(cargaStock.getNombre()))
					if(cargaStock.getCantidad()<=actual.getValue()){
						aux = actual.getValue().intValue()-cargaStock.getCantidad().intValue();
						actual.setValue(Integer.valueOf(aux));
					}
					else{
						mensajeError="La cantidad elegida es mayor que el stock disponible!";
					}		
		}
		modelo.put("mensajeError", mensajeError);
		return new ModelAndView("redirect:eliminar", modelo);
	}
}
