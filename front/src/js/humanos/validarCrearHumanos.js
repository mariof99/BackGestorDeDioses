import {crearHumanoIndiv} from "../http/httpProvider";
import {limpiarForm} from "../pruebas/pruebasComponentes";
import {alert} from "../alerts/alert";

const formHumanoIndiv = document.getElementById('formHumanoIndiv');
const formHumanoMultiple = document.getElementById('formHumanoMultiple');

formHumanoIndiv.addEventListener('submit', e => {
    const data = new FormData(formHumanoIndiv);
    const datosHumano = Object.fromEntries(data.entries());
    e.preventDefault();
    
    try {
        crearHumanoIndiv(datosHumano).then(resp => {
            limpiarForm(formHumanoIndiv.id);
            if (resp.success) {
                alert('Humano creado con éxito', 'success', 'crearHumanoAlert');
            }
            else {
                alert('Se ha producido un error', 'danger', 'crearHumanoAlert');
            }
        });
    }
    catch (err) {
        alert('Se ha producido un error', 'danger', 'crearHumanoAlert');
    }
});

formHumanoMultiple.addEventListener('submit', e => {
    const data = new FormData(formHumanoMultiple);
    const datosNHumano = Object.fromEntries(data.entries());
    e.preventDefault()
});