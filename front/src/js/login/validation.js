import { guardarUserLs } from "../localStorage/localStorage";
import { consultUsuario } from "./crud-provider";

const form = document.getElementById('loginForm');
const email = document.getElementById('email');
const emailError = document.querySelector('span.error');
//const name= document.getElementById('name');

const init = () => {
    validation();
}

const validation = () => {
    email.addEventListener('input', (event) => {
        if(email.validity.valid) {
           
            emailError.innerHTML=''; //Restablece el contenido del mensaje
            emailError.className='error'; //Restablece el estado visual el mensaje
        } else { //Si todavía hay error, muestra el error
            showError();
        }
    });

    form.addEventListener('submit', (event) => {
        if(!email.validity.valid) {
            showError();
            event.preventDefault(); //Evitamos que se envíe el formulario
        } else {
            event.preventDefault();
            const data = new FormData(form);
            const usuario = Object.fromEntries(data);
            consultUsuario(usuario).then(data => {
                if (data.success) {
                    guardarUserLs(data.data);
                    
                    if (data.data.rol == 'dios') {
                        window.location.replace("http://localhost:8080/html/crearPruebas.html");
                    }
                    else if (data.data.rol == 'humano') {
                        window.location.replace("http://localhost:8080/html/pasarPruebas.html");
                    }
                }
            });
        }
    });
}

const showError = () => {
    if(email.validity.valueMissing) {
        emailError.textContent = 'El campo no se ajusta a un correo estándar';
    } else if(email.validity.typeMismatch) {
        emailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.'
    } else if(email.validity.tooShort) {
        emailError.textContent = `El correo electrónico debe tener al menos ${email.minLenght} caracteres.`
    }
    emailError.className='error';
}

export {
    init
}