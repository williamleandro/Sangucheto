package tallerweb.sanguchetto.modelo;

import org.junit.Assert;
import org.junit.Test;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.TipoIngrediente;

public class SanguchettoTest {

    @Test
    public void testVaciar() {
        Sanguchetto sanguchetto = Sanguchetto.getInstance();
        Ingrediente ingredienteUno = new Ingrediente();
        ingredienteUno.setNombre("Milanesa");
        ingredienteUno.setPrecio(23.50);
        ingredienteUno.setTipo(TipoIngrediente.INGREDIENTE);
        
        sanguchetto.agregarIngrediente(ingredienteUno);
        
        ingredienteUno.setNombre("Salsa Golf");
        ingredienteUno.setPrecio(5.20);
        ingredienteUno.setTipo(TipoIngrediente.CONDIMENTO);
        
        sanguchetto.agregarIngrediente(ingredienteUno);
        
        sanguchetto.vaciar();
        
        Assert.assertEquals(sanguchetto.getIngredientes().size(), 0);
    }

    @Test
    public void testAgregarIngrediente() {
    	 Sanguchetto sanguchetto = Sanguchetto.getInstance();
         Ingrediente ingredienteUno = new Ingrediente();
         ingredienteUno.setNombre("Milanesa");
         ingredienteUno.setPrecio(23.50);
         ingredienteUno.setTipo(TipoIngrediente.INGREDIENTE);
         
         sanguchetto.agregarIngrediente(ingredienteUno);
         
         ingredienteUno.setNombre("Salsa Golf");
         ingredienteUno.setPrecio(5.20);
         ingredienteUno.setTipo(TipoIngrediente.CONDIMENTO);
         
         sanguchetto.agregarIngrediente(ingredienteUno);
         
         Assert.assertTrue(sanguchetto.getIngredientes().size() == 2);
         sanguchetto.vaciar();
    }

    @Test
    public void testVerIngredientes() {
    	Sanguchetto sanguchetto = Sanguchetto.getInstance();
        Ingrediente ingredienteUno = new Ingrediente();
        ingredienteUno.setNombre("Milanesa");
        ingredienteUno.setPrecio(23.50);
        ingredienteUno.setTipo(TipoIngrediente.INGREDIENTE);
        
        sanguchetto.agregarIngrediente(ingredienteUno);
        
        Ingrediente ingredienteDos = new Ingrediente();
        ingredienteDos.setNombre("Salsa Golf");
        ingredienteDos.setPrecio(5.20);
        ingredienteDos.setTipo(TipoIngrediente.CONDIMENTO);
        
        sanguchetto.agregarIngrediente(ingredienteDos);
        
        for (Ingrediente ingrediente : sanguchetto.verIngredientes()) {
			Assert.assertTrue(ingrediente.getNombre().equals("Milanesa"));
		}
        sanguchetto.vaciar();
    }

    @Test
    public void testVerCondimentos() {
    	Sanguchetto sanguchetto = Sanguchetto.getInstance();
        Ingrediente ingredienteUno = new Ingrediente();
        ingredienteUno.setNombre("Milanesa");
        ingredienteUno.setPrecio(23.50);
        ingredienteUno.setTipo(TipoIngrediente.INGREDIENTE);
        
        sanguchetto.agregarIngrediente(ingredienteUno);
        
        Ingrediente ingredienteDos = new Ingrediente();
        ingredienteDos.setNombre("Salsa Golf");
        ingredienteDos.setPrecio(5.20);
        ingredienteDos.setTipo(TipoIngrediente.CONDIMENTO);
        
        sanguchetto.agregarIngrediente(ingredienteDos);
        
        for (Ingrediente ingrediente : sanguchetto.verCondimentos()) {
			Assert.assertTrue(ingrediente.getNombre().equals("Salsa Golf"));
		}
        sanguchetto.vaciar();
    }

    @Test
    public void testGetPrecio() {
    	Sanguchetto sanguchetto = Sanguchetto.getInstance();
        Ingrediente ingredienteUno = new Ingrediente();
        ingredienteUno.setNombre("Milanesa");
        ingredienteUno.setPrecio(23.50);
        ingredienteUno.setTipo(TipoIngrediente.INGREDIENTE);
        
        sanguchetto.agregarIngrediente(ingredienteUno);
        
        Ingrediente ingredienteDos = new Ingrediente();
        ingredienteDos.setNombre("Salsa Golf");
        ingredienteDos.setPrecio(5.20);
        ingredienteDos.setTipo(TipoIngrediente.CONDIMENTO);
        
        sanguchetto.agregarIngrediente(ingredienteDos);
       
        Assert.assertEquals(28.70,sanguchetto.getPrecio(), 0);
        
        sanguchetto.vaciar();
    }
}
