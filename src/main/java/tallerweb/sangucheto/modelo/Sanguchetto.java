package tallerweb.sangucheto.modelo;

import java.util.LinkedList;
import java.util.List;

public class Sanguchetto {

	private static Sanguchetto instance = new Sanguchetto();
	private List<Ingrediente> ingredientes = new LinkedList<Ingrediente>();
	
	private Sanguchetto(){}
	
	public static Sanguchetto getInstance(){
		return instance;
	}
	
	/**
	 * Elimina todos los ingredientes del sanguchetto.<br>
	 */
	public void vaciar(){
		this.ingredientes.clear();
	}
	
	/**
	 * Agrega un ingrediente al carrito.<br>
	 * @param ingrediente
	 */
	public void agregarIngrediente(Ingrediente ingrediente){
		this.ingredientes.add(ingrediente);
	}
	
	/**
	 * Lista todos los ingredientes que forman parte del sanguchetto.<br>
	 * @return
	 */
	public List<Ingrediente> verIngredientes(){
		List<Ingrediente> listaIngredientes = new LinkedList<Ingrediente>();
		
		for (Ingrediente ingrediente : this.ingredientes) {
			if(ingrediente.getTipo().equals(TipoIngrediente.INGREDIENTE))
				listaIngredientes.add(ingrediente);
		}
		return listaIngredientes;
	}
	
	/**
     * Lista todos los condimentos que forman parte del sanguchetto.<br>
     * @return
     */
    public List<Ingrediente> verCondimentos(){
    	List<Ingrediente> listaCondimentos = new LinkedList<Ingrediente>();
		
		for (Ingrediente condimento : this.ingredientes) {
			if(condimento.getTipo().equals(TipoIngrediente.CONDIMENTO))
				listaCondimentos.add(condimento);
		}
		return listaCondimentos;
    }
	
	/**
	 * Devuelve el precio total del sanguchetto.<br>
	 * @return
	 */
	public Double getPrecio(){
		Double precioTotal = 0.0;
		
		for (Ingrediente ingrediente : ingredientes) {
			precioTotal+= ingrediente.getPrecio();
		}
		return redondear(precioTotal, 2);
	}
	
	/**
	 * Devuelve la lista de ingredientes que tiene el {@code Sanguchetto}
	 * @return {@link List}
	 */
	public List<Ingrediente> getIngredientes() {
		return ingredientes;
	}
	
	/**
	 * Elimina un ingrediente que se saca del {@code Sanguchetto}
	 * @param ingredienteAEliminar
	 * @return {@link Boolean}
	 */
	public Boolean eliminarIngrediente(Ingrediente ingredienteAEliminar) {
		if(!this.ingredientes.contains(ingredienteAEliminar))
			return false;
		
		ingredientes.remove(ingredienteAEliminar);
		return true;
	}
	
	/**
	 * Redondea un numero {@code Double} hasta la cantidad de decimales indicado como parametro.
	 * @param numero
	 * @param decimales
	 * @return {@link Double}
	 */
	public static Double redondear(Double numero, int decimales) {
		Double aux = Math.round(numero.doubleValue()*Math.pow(10, decimales))/Math.pow(10, decimales);
		return aux;
	}
	
	public Double aplicarDescuento(Double precio, Double porcDescuento) {
		Double aux = precio * porcDescuento;
		return redondear(aux, 2);
	}
	
	public Double descuentoTotal(Double precio, Double descuento) {
		Double aux = precio - descuento;
		return redondear(aux, 2);
	}
	
}
