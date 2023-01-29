import {insertPreguntaEleccion} from "../../http/httpProvider";
import {limpiarForm} from "../pruebasComponentes";
import {alert} from '../../alerts/alert';

const form = document.getElementById('formPrueba50');

form.addEventListener('submit', async(e) => { 
    const data = new FormData(form);
    const datosPrueba = Object.fromEntries(data.entries());
    e.preventDefault();

    try {
        insertPreguntaEleccion(datosPrueba).then(resp => {
            limpiarForm(form.id);
            console.log(resp);
            if (resp.success) {
                console.log('eee');
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