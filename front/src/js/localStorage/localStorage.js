
export const cargarUserLs = () => {
    const user = (localStorage.getItem('user')) 
        ? JSON.parse(localStorage.getItem('user'))
        : [];

        return user;
}

export const guardarUserLs = (user) => {
    localStorage.setItem('user', JSON.stringify(user));
}

export const guardarPruebasLs = (pruebas) => {      // guardo los ids de las pruebas para poder compararlos y saber
    let idPruebas = [];                             // de que tipo es cada una.
    for (const tipo in pruebas) {
        console.log(tipo);
        if (Object.hasOwnProperty.call(pruebas, tipo)) {
            const pruebasTipo = pruebas[tipo];

            pruebasTipo.forEach(prueba => {
                idPruebas.push(prueba.id);
            });
            localStorage.setItem(tipo, idPruebas);
            idPruebas = [];
        }
    }
}
