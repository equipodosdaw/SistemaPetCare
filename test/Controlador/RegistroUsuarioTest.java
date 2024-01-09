package Controlador;
import Modelo.DAOUSUARIO;
import Modelo.Usuario;


import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;


public class RegistroUsuarioTest {
    
    @Test
    public void testRegistrarUsuario() throws Exception {
        // Crear una instancia de la clase SrvUsuario
        SrvUsuario srvUsuario = new SrvUsuario();

        // Configurar MockMvc
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(srvUsuario).build();

        // Simular una solicitud de registro de usuario
        mockMvc.perform(MockMvcRequestBuilders.post("/srvUsuario")
                .param("accion", "registrar")
                .param("txtNombre", "NombreUsuario")
                .param("txtEmail", "correo@example.com")
                .param("txtClave", "contraseña")
                .param("txtClave2", "contraseña"))
                .andExpect(MockMvcResultMatchers.request().attribute("registerOk", true));

        // Verificar si el usuario se añadió a la base de datos
        Usuario usuarioParaIdentificar = new Usuario();
        usuarioParaIdentificar.setEmail("correo@example.com");
        usuarioParaIdentificar.setClave("contraseña");

        DAOUSUARIO daoUsuario = new DAOUSUARIO();
        Usuario usuarioRegistrado = daoUsuario.identificar(usuarioParaIdentificar);

        assertNotNull("El usuario no fue registrado correctamente en la base de datos", usuarioRegistrado);
        assertEquals("NombreUsuario", usuarioRegistrado.getNombreUsuario());
        assertEquals("correo@example.com", usuarioRegistrado.getEmail());
        

        // Eliminar el usuario creado durante la prueba
        daoUsuario.eliminarUsuario(usuarioRegistrado);
    }
}
