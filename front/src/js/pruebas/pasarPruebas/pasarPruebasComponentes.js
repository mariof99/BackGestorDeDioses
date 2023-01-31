let contTarjetasPasarPrueba = document.getElementById('contcontenedorTarjetasPasarPruebas');

const crearHtmlPasarPruebaRespLibre = (prueba, tipo) => {
    let pruebaDiv = document.createElement('div');
    pruebaDiv.classList.add('accordion', 'mb-4', 'rounded-3');

    pruebaDiv.id = 'pasarp' + prueba.id;

    const html = `
        <div class="accordion-item ">
            <h2 class="accordion-header" id="headingOne">
                <button
                    class="accordion-button d-flex justify-content-between position-relative"
                    type="button" data-bs-toggle="collapse"
                    data-bs-target="#despleg${(pruebaDiv.id)}">
                    ${(prueba.titulo)}
                </button>
            </h2>
            <ul class="accordion-collapse collapse list-group contenedorTarjetasPrueba"
                aria-labelledby="headingOne" id="despleg${(pruebaDiv.id)}">
                <li>
                    <div class="container">
                        <form class="formPasar" id="formPasar${(prueba.id)}">
                            <div class="row">
                                <div class="col-12 p-3">
                                    <b>Título:</b> ${(prueba.titulo)}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-3">
                                    <b>Tipo:</b> Respuesta libre
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-3">
                                    <b>Destino:</b> ${(prueba.destino)}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-3">
                                    <b>Pregunta:</b> ${(prueba.pregunta)}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 p-3 d-flex justify-content-around">
                                    <label for="palabrasPropuestas"><b>Respuesta:</b></label>
                                    <input type="text" name="palabrasPropuestas" class="w-50" 
                                        placeholder="separado por espacios"
                                    >
                                </div>
                            </div>
                            <div>
                                <div class="co-12 p-3">
                                    <button class="btn btn-primary" type="submit">Pasar
                                        prueba</button>
                                </div>
                            </div>
                        </form>
                        </div>
                </li>
            </ul>
        </div>
    `;

    pruebaDiv.innerHTML = html;
    contTarjetasPasarPrueba.append(pruebaDiv);
}

const crearHtmlPasarPruebaPuntual = (prueba) => {
    let pruebaDiv = document.createElement('div');
    pruebaDiv.classList.add('accordion', 'mb-4', 'rounded-3');

    pruebaDiv.id = 'pasarp' + prueba.id;

    const html = `
        <div class="accordion mb-4 rounded-3">
            <div class="accordion-item ">
                <h2 class="accordion-header" id="headingOne">
                    <button
                        class="accordion-button d-flex justify-content-between position-relative"
                        type="button" data-bs-toggle="collapse"
                        data-bs-target="#despleg${(pruebaDiv.id)}">
                        ${(prueba.titulo)}
                    </button>
                </h2>
                <ul class="accordion-collapse collapse list-group contenedorTarjetasPrueba"
                    aria-labelledby="headingOne" id="despleg${(pruebaDiv.id)}">
                    <li>
                        <div class="container">
                            <form class="formPasar" id="formPasar${(prueba.id)}">
                                <div class="row">
                                    <div class="col-8 p-3">
                                        <b>Título:</b> ${(prueba.titulo)}
                                    </div>
                                    <div class="col-4 p-3">
                                        <b>Tipo:</b> Puntual
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6 p-3">
                                        <b>Destino:</b> ${(prueba.destino)}
                                    </div>
                                    <div class="col-6 p-3">
                                        <b>Atributo:</b> ${(prueba.atributo)}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 p-3">
                                        <b>Descripción:</b> ${(prueba.descripcion)}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 p-3">
                                        <b>Porcentaje de dificultad:</b> ${(prueba.porcentaje)}
                                    </div>
                                </div>
                                <div>
                                    <div class="co-12 p-3">
                                        <button class="btn btn-primary" type="submit">Pasar
                                            prueba</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    `;

    pruebaDiv.innerHTML = html;
    contTarjetasPasarPrueba.append(pruebaDiv);
}


export const pintarPasarPruebas = (pruebas) => {
    pruebas.respLibre.forEach(prueba => {
        crearHtmlPasarPruebaRespLibre(prueba);
    });

    pruebas.puntuales.forEach(prueba => {
        crearHtmlPasarPruebaPuntual(prueba, 'puntual');
    })
}