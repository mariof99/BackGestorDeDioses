<?php

namespace App\Http\Controllers;

use App\Models\Mensaje;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Nette\Utils\Json;

class HermesController extends Controller {
    
    public function getMensajes($id) {

        try {
        $respuesta = DB::select('SELECT users.name, mensajes.asunto, mensajes.cuerpo FROM users JOIN usr_mensaje
            ON users.id = usr_mensaje.id_env JOIN mensajes ON usr_mensaje.id_mensaje = mensajes.id 
            WHERE usr_mensaje.id_dest = ?', [$id]);
            $cod = 200;
        }
        catch(\Exception $e) {
            $respuesta = 'se ha producido un error';
            $cod = 400;
        }

        return response()->json($respuesta, $cod);
    }

    public function enviarMensaje($idEnv, Request $request) {
        $m = new Mensaje;
        $m->timestamps = false;
        $m->asunto = $request->asunto;
        $m->cuerpo = $request->cuerpo;

        try {
            $m->save();
            
            foreach (json_decode(json_encode($request->idsDest, true)) as $idDest) {
                DB::select('INSERT INTO usr_mensaje (id_env, id_dest, id_mensaje) VALUES (?, ?, ?)', [$idEnv, $idDest, $m->id]);
            }

            $msg = 'insertado con éxito';
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = 'ha sucedido un error';
            $cod = 400;
        }

        return response()->json($msg, $cod);
    }
}

