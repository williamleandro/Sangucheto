package tallerweb.sangucheto.modelo;

//import java.util.HashMap;
//import java.util.Map;

/*
 * Solo contiene Nombre de producto y cantidad
 * 
 * 
 * */
public class CargaStock {

	
	//private Map<String, Integer> mapaDeCarga = new HashMap<String, Integer>();
	private String nombre;
	private Integer cantidad;
	
	
	public CargaStock(){}

	public void setCantidad(Integer cantidad){
		this.cantidad = cantidad;
	}
	public Integer getCantidad(){
		return this.cantidad;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public String getNombre(){
		return this.nombre;
	}
	/*
	public Map<String,Integer> getMapaDeCarga(){
		return this.mapaDeCarga;
	}
	
	public void setMapaDeCarga(String nombre_key, Integer cantidad_value){
		mapaDeCarga.put(nombre_key, cantidad_value);
	}*/

}
