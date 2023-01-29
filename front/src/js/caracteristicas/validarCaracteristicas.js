import {updateCaracteristicas} from "../http/httpProvider";
import {rellenarTablaCaracteristicas} from "./caracteristicasComponentes";
import {alert} from "../alerts/alert";


export const validacion = () => {
    const form = document.getElementById('formCaracteristicas');
    // const campos = form.getElementsByClassName('inputCaracteristica');
    // const errorSpan = form.getElementsByClassName('error')[0];

    console.warn(form);

    form.addEventListener('submit', async(e) => {
        e.preventDefault();
        const data = new FormData(form);
        const caracteristicas = Object.fromEntries(data.entries());
        try {
            const resp = await updateCaracteristicas(caracteristicas); // EN CUARENTENA
            if (resp.success) {
                alert('Características actualizadas con éxito', 'success', 'cambiarCaracteristicasAlert');
            }
            else {
                alert('Se ha producido un error', 'danger', 'cambiarCaracteristicasAlert');
            }
        }
        catch (err) {
            alert('Se ha producido un error', 'danger', 'cambiarCaracteristicasAlert');
        }
        // await rellenarTablaCaracteristicas();
    });
}