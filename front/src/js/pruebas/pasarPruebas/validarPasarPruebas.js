import {fetchPruebasHumanos, pasarPruebaPuntual} from "../../http/httpProvider";


export const validacion = async() => {

    const pruebas = await fetchPruebasHumanos();

    let idPruebas = []; 
    let tipoIds = {}                          
    for (const tipo in pruebas) {
        console.log(tipo);
        if (Object.hasOwnProperty.call(pruebas, tipo)) {
            const pruebasTipo = pruebas[tipo];

            pruebasTipo.forEach(prueba => {
                idPruebas.push(prueba.id);
            });
            tipoIds[tipo] = idPruebas;
            idPruebas = [];
        }
    }

    const forms = document.querySelectorAll('.formPasar');

    forms.forEach(form => {
        const idPrueba = form.id.substring(9)
        let tipoPruebaPasar = '';

        for (const tipo of tipoIds) {       // utilizo un break para que no siga comprobando. Creo que está bien utilizarlo
            if (tipo.includes(idPrueba)) {  // aquí ya que es un bucle muy sencillo.
                tipoPruebaPasar = tipo;
                break;
            }
        }

        form.addEventListener('submit', e => {
            let resp = null;
            switch (tipoPruebaPasar) {
                case 'puntuales':
                    resp = pasarPruebaPuntual(idPrueba);
                    break;

                case 'respLibre':
                    const data = new FormData(form);
                    const datosPrueba = Object.fromEntries(data.entries());
                    
                default:
                    break;
            }
            
            e.preventDefault();
        });
    });

}