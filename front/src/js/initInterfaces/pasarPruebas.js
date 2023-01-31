import '../../styles.scss';
import * as bootstrap from 'bootstrap';

import {pintarPasarPruebas} from '../pruebas/pasarPruebas/pasarPruebasComponentes';
import {fetchPruebasHumanos} from '../http/httpProvider';
import {validacion} from '../pruebas/pasarPruebas/validarPasarPruebas';

fetchPruebasHumanos().then(pruebas => {
    pintarPasarPruebas(pruebas);
    validacion();
});