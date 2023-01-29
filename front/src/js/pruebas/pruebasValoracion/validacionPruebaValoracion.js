import {insertPruebaValoracion} from "../../http/httpProvider";
import {limpiarForm} from "../pruebasComponentes";
import {alert} from '../../alerts/alert';

const form = document.getElementById('formPruebaValoracion');

form.addEventListener('submit', async(e) => { 
    const data = new FormData(form);
    const datosPrueba = Object.fromEntries(data.entries());
    e.preventDefault();

    try {
        insertPruebaValoracion(datosPrueba).then(resp => {
            limpiarForm(form.id);
            if (resp.success) {
                alert('Prueba creada con éxito', 'success', 'crearPruebaAlert');
            }
            else {
                alert('Error al crear la prueba', 'danger', 'crearPruebaAlert');
            }
        });
    }
    catch (err) {
        alert('Error al crear la prueba', 'danger', 'crearPruebaAlert');
    }
});