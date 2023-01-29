import '../../styles.scss';
import * as bootstrap from 'bootstrap';

import  {rellenarContHumanos, rellenarContPruebas, pintarAsignarPruebas} from '../asignarPruebas/asignarPruebasComponentes';
import {fetchPruebas, fetchHumanos, fetchAsigPruebas, asignarPruebas} from "../http/httpProvider";
const {guardarHumanosLs} = require("../localStorage/localStorage");

const alerts = document.querySelectorAll('cartelito');

const resolverEnOrden = async() => {
    const humanos = await fetchHumanos();
    const pruebas = await fetchPruebas();
    const humanosPruebas = await fetchAsigPruebas();


    rellenarContHumanos(humanos);
    rellenarContPruebas(pruebas);
    if (humanosPruebas.length > 0) pintarAsignarPruebas(humanosPruebas, humanos);
}

resolverEnOrden().then(data => {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
});
