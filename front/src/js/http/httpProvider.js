import {cargarUserLs} from "../localStorage/localStorage";

const urlInfo = 'http://127.0.0.1:8001/api/cosa';
const urlPruebas = 'http://127.0.0.1:8001/api/pruebas';

const user = cargarUserLs();

export const fetchDestino = async() => {
    try {
        
        const resp = await fetch(urlInfo + '/getdestino/' + user.id); // + el user
        
        if(!resp.ok) throw ('No se pudo realizar la petición');
        // resp.json().then(console.log);
        
        const {destino} = await resp.json();
        
        return destino;
    }
    catch (error) {
        throw error;
    }
}

export const fetchCaracteristicas = async() => {
    try {
        const resp = await fetch(urlInfo + '/getcaracteristicas/' + user.id); // + el user
        if(!resp.ok) throw ('No se pudo realizar la petición');
        const caracteristicas = await resp.json();

        return caracteristicas;
    }
    catch (error) {
        throw error;
    }
}

export const updateCaracteristicas = async(caracteristicas) => { // EN CUARENTENA

    const resp = await fetch(urlInfo + '/updatecaracteristicas/' + user.id, { // + el user
        method: 'PUT', 
        body: JSON.stringify(caracteristicas),
        headers: {'Content-Type': 'application/json'} 
    });

    return await resp.json(); 
}

// export const updateCaracteristicas2 = async() => { // EN CUARENTENA
//     const options = {
//         method: 'PUT',
//         body: '{"sabiduria":5,"nobleza":5,"virtud":1,"maldad":4,"audacia":1}'
//       };
      
//       fetch('http://127.0.0.1:8000/api/cosa/updatecaracteristicas/1', options)
//         .then(response => response.json())
//         .then(response => console.log(response))
//         .catch(err => console.error(err));
// }

export const insertPreguntaEleccion = async(datos) => {

    const resp = await fetch(urlPruebas
            + '/insertpruebaeleccion', {
        method: 'POST',
        body: JSON.stringify(datos),
        headers: {'Content-Type': 'application/json'} 
        });

    return await resp.json();
}

export const insertPruebaPuntual = async(datos) => {
    const resp = await fetch(urlPruebas
            + '/insertpruebapuntual', {
        method: 'POST',
        body: JSON.stringify(datos),
        headers: {'Content-Type': 'application/json'}
        });

    return await resp.json();
}

export const insertPruebaRespLibre = async(datos) => {
    const resp = await fetch(urlPruebas
        + '/insertpruebaresplibre', {
    method: 'POST',
    body: JSON.stringify(datos),
    headers: {'Content-Type': 'application/json'}
    });

    return await resp.json();
}

export const insertPruebaValoracion = async(datos) => {
    console.log(datos);
    const resp = await fetch(urlPruebas
            + '/insertpruebavaloracion', {
        method: 'POST',
        body: JSON.stringify(datos),
        headers: {'Content-Type': 'application/json'}
        });

    return await resp.json();
}

export const fetchPruebas = async() => {
    try {
        const resp = await fetch(urlPruebas + '/getpruebas');
        if(!resp.ok) throw ('No se pudo realizar la petición');
        // resp.json().then(console.log);
        const pruebas = await resp.json();
        
        return pruebas;
    }
    catch (error) {
        throw error;
    }
}

export const fetchHumanos = async() => {
    try {
        const resp = await fetch(urlInfo + '/gethumanos/' + user.id);
        if (!resp.ok) throw ('No se pudo realizar la petición');
        
        const humanos = await resp.json();

        return humanos;
    }
    catch (error) {
        throw error;
    }
}

export const fetchAsigPruebas = async() =>  { // CAMBIAR NOMBRE
    try {
        const resp = await fetch(urlPruebas + '/gethumanosasig/' + user.id); // + el dios
        if(!resp.ok) throw ('No se pudo realizar la petición');
        const humanosAsig = await resp.json();

        return humanosAsig;
    }
    catch (error) {
        throw error;
    }
}

export const asignarPruebas = async(asignacion) => {

    const resp = await fetch(urlPruebas
        + '/asignarprueba', {
    method: 'POST',
    body: JSON.stringify(asignacion),
    headers: {'Content-Type': 'application/json'}
    });

    return await resp.json();
}

export const crearHumanoIndiv = async(humano) => {
    console.log(humano);
    const resp = await fetch(urlInfo
        + '/crearhumanodios/' + user.id, {
            method: 'POST',
            body: JSON.stringify(humano),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + user.token
            }
        });

        console.log(resp);
    return await resp.json();
}

export const crearHumanoMultiple = async(nHumanos) => {
    const resp = await fetch(urlInfo
        + '/crearhumanomultiple/' + user.id, {
            method: 'POST',
            body: JSON.stringify(humano),
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + user.token
            }
        });

    return await resp.json();



}