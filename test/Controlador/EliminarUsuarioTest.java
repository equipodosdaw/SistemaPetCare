
package Controlador;
import Modelo.DAOUSUARIO;
import Modelo.Usuario;

import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class EliminarUsuarioTest {
    
    @Test
public void testCrearYEliminarUsuario() throws Exception {
    // Crear una instancia de la clase SrvUsuario
    SrvUsuario srvUsuario = new SrvUsuario();

    // Configurar MockMvc
    MockMvc mockMvc = MockMvcBuilders.standaloneSetup(srvUsuario).build();

    // Simular una solicitud para crear un usuario
    mockMvc.perform(MockMvcRequestBuilders.post("/srvUsuario")
            .param("accion", "registrar")
            .param("txtNombre", "NombreUsuario")
            .param("txtEmail", "correo@example.com")
            .param("txtClave", "contraseña")
            .param("txtClave2", "contraseña"))
            .andExpect(MockMvcResultMatchers.request().attribute("registerOk", true));

    // Obtener el ID del usuario creado 
    DAOUSUARIO daoUsuario = new DAOUSUARIO();
    Usuario usuarioParaIdentificar = new Usuario();
    usuarioParaIdentificar.setEmail("correo@example.com");
    usuarioParaIdentificar.setClave("contraseña");
    Usuario usuarioCreado = daoUsuario.identificar(usuarioParaIdentificar);
    assertNotNull("No se pudo obtener el ID del usuario creado", usuarioCreado);
    int idUsuarioCreado = usuarioCreado.getId_usuario();

    // Simular una solicitud para eliminar al usuario recién creado
    mockMvc.perform(MockMvcRequestBuilders.post("/srvUsuario")
            .param("accion", "eliminarUsuario")
            .param("cod", String.valueOf(idUsuarioCreado)))
            .andExpect(MockMvcResultMatchers.redirectedUrl("srvUsuario?accion=listasUsuarios"));

    // Verificar que el usuario se eliminó correctamente
    Usuario usuarioComprobar = new Usuario();
    usuarioComprobar.setId_usuario(idUsuarioCreado);
    Usuario usuarioEliminado = daoUsuario.leerUsuario(usuarioComprobar);
    assertNull("El usuario no se eliminó correctamente", usuarioEliminado);
}

}
