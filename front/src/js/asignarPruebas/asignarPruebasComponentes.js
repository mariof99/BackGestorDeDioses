import {cargarHumanosLs} from "../localStorage/localStorage";
import {asignarPruebas, fetchHumanos} from "../http/httpProvider";
import {alert} from '../alerts/alert';

let contTarjetasPrueba = document.querySelectorAll('.contcontenedorTarjetasPruebas')[0];
let contTarjetasHumano = document.querySelectorAll('.contenedorTarjetasHumanos')[0];


const crearTarjHumanoPruebaHtml = (tarjetaPrueba, nombre) => {

    let tarjDiv = document.createElement('li');
    tarjDiv.classList.add('list-group-item');
    tarjDiv.innerHTML = nombre;


    tarjetaPrueba.append(tarjDiv);
}

const crearTarjHumanoHtml = (humano) => {
    let tarjDiv = document.createElement('div');
    tarjDiv.classList.add('card', 'mb-4', 'rounded-3', 'shadow-sm', 'tarjetaHumano');
    tarjDiv.id = 'h' + humano.id;
    tarjDiv.nombre = humano.name;
    tarjDiv.draggable = true;



    const html = `
        <div class="card-body d-flex align-items-center justify-content-center">
            ${(humano.name)}
            <span class="iconoInfoHum position-absolute"
                data-bs-toggle="tooltip" data-bs-placement="right" 
                data-bs-html="true" data-bs-title="
                    <b>destino:</b> n<br>
                    <b>email:</b> correo@gmail.com<br><br>
                    <b>sabiduría:</b> n<br>
                    <b>virtud:</b> n<br>
                    <b>valentía:</b> n<br>
                    <b>maldad:</b> n<br>
                    <b>audacia:</b> n<br><br>
                "
            >?</span>    
        </div>
    `;


    tarjDiv.innerHTML = html;

    tarjDiv.addEventListener('dragstart', e => {
        e.dataTransfer.setData('text', e.target.id)
    });

    contTarjetasHumano.append(tarjDiv);


    return tarjDiv;
}

const generarHtmlTooltip = (prueba, tipo) => {

    let html = '';

    switch (tipo) {
        case 'puntuales':
            html = `
                <b>Tipo: </b> puntual;
                <br><br>
                <b>Descripción</b>
                <p>
                    ${(prueba.descripcion)}
                </p>
                <p>
                    <b>Destino: </b> ${(prueba.destino)} 
                    <br>
                    <b>Porcentaje: </b> ${(prueba.porcentaje)}%
                    <br>
                    <b>Atributo: </b> ${(prueba.atributo)}
                    <br>
                </p>
                `;

            break;
        case 'eleccion' :
            html = `
                <b>Tipo: </b> elección
                <br><br>
                <b>Pregunta: </b>
                <p>
                    ${(prueba.pregunta)}
                </p>
                <p>
                    <b>Destino: </b> ${(prueba.destino)} 
                    <br>
                    <b>Respuesta correcta: </b> ${(prueba.respuesta_correcta)} 
                    <br>
                    <b>Respuesta incorrecta: </b> ${(prueba.respuesta_incorrecta)} 
                    <br>
                    <b>Atributo: </b> ${(prueba.atributo)}
                    <br>
                </p>
                `;

            break;

        case 'valoracion' :
            html = `
                <b>Tipo </b> valoración
                <br><br>
                <b>Pregunta: </b>
                <p>
                    ${(prueba.pregunta)}
                </p>
                <p>
                <p>
                    <b>Destino: </b> ${(prueba.destino)} 
                    <br>
                    <b>Respuesta: </b> ${(prueba.respuesta)} 
                    <br>
                    <b>Atributo: </b> ${(prueba.atributo)}
                    <br>
                </p>
            `;
            break;

        case 'respLibre' :
            html = `
                <b>Tipo: </b> respuesta libre
                <br><br>
                <b>Pregunta: </b>
                <p>
                    ${(prueba.pregunta)}
                </p>
                <p>
                    <b>Destino: </b> ${(prueba.destino)}
                    <br>
                    <b>Palabras clave: </b>
                    <p>
            `;

            prueba.palabras_clave.forEach(palabra => {
                html += `${(palabra)}  `;
            });

            html += `
                    </p>

                    <b>Porcentaje: </b> ${(prueba.porcentaje)}%
                </p>
            `;

            break;

        default:
            break;
    }

        return html;
}

const crearTarjPrueba = (prueba, tipo) => {
    let tarjDiv = document.createElement('div');
    tarjDiv.classList.add('accordion', 'mb-4', 'rounded-3', 'tarjPrueba');
    tarjDiv.id = 'p' + prueba.id;

    
    const htmlToolip = generarHtmlTooltip(prueba, tipo);

    const html = `
        <div class="accordion-item ">
            <h2 class="accordion-header" id="headingOne${(tarjDiv.id)}">
                <button
                    class="accordion-button d-flex justify-content-between position-relative"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#desp${(tarjDiv.id)}"
                >
                    ${(prueba.titulo)}
    
                    <span class="iconoInfo position-absolute"
                        data-bs-toggle="tooltip" data-bs-placement="right" 
                        data-bs-html="true" data-bs-title="${(htmlToolip)}"
                    >?</span>
                </button>
            </h2>
                <ul
                    class="accordion-collapse collapse list-group contenedorTarjetasPrueba"
                    aria-labelledby="headingOne"
                    id="desp${(tarjDiv.id)}"
                >
            </ul>
        </div>
    `;


    tarjDiv.innerHTML = html;
    contTarjetasPrueba.append(tarjDiv);

    tarjDiv.addEventListener('dragover', e => {
        e.preventDefault();
    });

    tarjDiv.addEventListener('drop', async(e) => {
        const data = e.dataTransfer.getData('text');
        const asig = {
            idPrueba : prueba.id,
            idHumano : parseInt(data.substring(1))
        }
        const resp = await asignarPruebas(asig);
        if (resp.success) {
            crearTarjHumanoPruebaHtml(tarjDiv.getElementsByTagName('ul')[0], document.getElementById(data).nombre);
            alert('Prueba asignada con éxito!', 'success', 'asignarPruebaAlert');
        }
        else {
            alert('Error al asignar la prueba', 'danger', 'asignarPruebaAlert');
        }

    });

    return tarjDiv;

}

export const pintarAsignarPruebas = (humanosPruebas, humanos) => { 

    let idPrueba = humanosPruebas[0].id;
    let tarj = document.getElementById('despp' + idPrueba);    
    for (const humanoPrueba of humanosPruebas) {
        if (humanoPrueba.id_prueba !== idPrueba) {
            idPrueba = humanoPrueba.id_prueba;
            tarj = document.getElementById('despp' + idPrueba); 
        }
        
        crearTarjHumanoPruebaHtml(tarj, humanos.filter(h => {return h.id === humanoPrueba.id_humano})[0].name);
    }
}

export const rellenarContHumanos = (humanos)  => {
    for (const humano of humanos) {
        // console.warn(humano);
        crearTarjHumanoHtml(humano);
    }
}

export const rellenarContPruebas = (pruebas) => {    
    for (const tipo in pruebas) {
        if (Object.hasOwnProperty.call(pruebas, tipo)) {
            const pruebasTipo = pruebas[tipo];
            for (const prueba of pruebasTipo) {
                crearTarjPrueba(prueba, tipo);
            }
        }
    }
}
