<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Humano;
use App\Models\Prueba;
use App\Models\PruebaEleccion;
use App\Models\PruebaOraculo;
use App\Models\PruebaPuntual;
use App\Models\PruebaRespLibre;
use App\Models\PruebaValoracion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class PruebasController extends Controller {

    // INSERT PRUEBAS

    private function insertPrueba($destino, $titulo) {
        $p = new Prueba;
        $resp = 0;

        $p->destino = $destino;
        $p->titulo = $titulo;
        try {
            $p->save();
            return $p->id;
        }
        catch (\Exception $e) {
            $resp = -1;
        }

        return response()->json(['cod' => $resp], 200);
    }

    private function insertPruebaOraculo($id, $pregunta) {
        $p = new PruebaOraculo;
        $resp = 0;

        $p->id = $id;
        $p->pregunta = $pregunta;
        try {
            $p->save();
        }
        catch (\Exception $e)  {
            $resp = -1;
        }

        return response()->json(['cod' => $resp], 200);
    }

    public function insertPruebaPuntual(Request $request) {
        $datos = $request->all();
        $resp = 0;

        $id = $this->insertPrueba($datos['destino'], $datos['titulo']);

        $p = new PruebaPuntual;

        $p->id = $id;
        $p->descripcion = $datos['descripcion'];
        $p->porcentaje = $datos['porcentaje'];
        $p->atributo = $datos['atributo'];

        try {
            $p->save();
        }
        catch (\Exception $e) {
            $resp = 0;
        }

        return response()->json(['cod' => $resp], 200);
    }


    public function insertPruebaEleccion(Request $request) {
        $datos = $request->all();
        $resp = 0;

        $id = $this->insertPrueba($datos['destino'], $datos['titulo']);
        $this->insertPruebaOraculo($id, $datos['pregunta']);

        $p = new PruebaEleccion;

        $p->id = $id;
        $p->respuesta_correcta = $datos['respuestaCorrecta'];
        $p->respuesta_incorrecta = $datos['respuestaIncorrecta'];
        $p->atributo = $datos['atributo'];
        try {
            $p->save();

        }
        catch (\Exception $e) {
            $resp = -1;
        }

        return response()->json(['cod' => $resp], 200);
    }


    public function insertPruebaRespLibre(Request $request) {
        $datos = $request->all();
        $resp = 0;

        $id = $this->insertPrueba($datos['destino'], $datos['titulo']);
        $this->insertPruebaOraculo($id, $datos['pregunta']);

        $p = new PruebaRespLibre;

        $p->id = $id;
        $p->palabras_clave = $datos['palabrasClave'];
        $p->porcentaje = $datos['porcentaje'];

        try {
            $p->save();
        }
        catch (\Exception $e) {
            $resp = -1;
        }

        return response()->json(['cod' => $resp], 200);
    }

    public function insertPruebaValoracion(Request $request) {
        $datos = $request->all();
        $resp = 0;

        $id = $this->insertPrueba($datos['destino'], $datos['titulo']);
        $this->insertPruebaOraculo($id, $datos['pregunta']);

        $p = new PruebaValoracion;

        $p->id = $id;
        $p->respuesta = $datos['valoracionCorrecta'];
        $p->atributo = $datos['atributo'];
        try {   
            $p->save();
        }
        catch (\Exception $e) {
            $resp = -1;
        }

        return response()->json(['cod' => $resp], 200);
    }

    // GET PRUEBAS

    public function getPruebas() { // probar
        $pruebas['eleccion'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
            respuesta_correcta, respuesta_incorrecta, atributo FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
            JOIN pruebas_eleccion on pruebas_oraculo.id = pruebas_eleccion.id');

        $pruebas['respLibre'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
            palabras_clave, porcentaje FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
            JOIN pruebas_resp_libre on pruebas_oraculo.id = pruebas_resp_libre.id');

        foreach ($pruebas['respLibre'] as $prueba) {
            $prueba->palabras_clave = explode(' ', $prueba->palabras_clave);
        }

        $pruebas['valoracion'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
            respuesta, atributo FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
            JOIN pruebas_valoracion on pruebas_oraculo.id = pruebas_valoracion.id');

        $pruebas['puntuales'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, descripcion,
            porcentaje, atributo FROM pruebas JOIN pruebas_puntuales on pruebas.id = pruebas_puntuales.id');


        return response()->json($pruebas, 200);
    }

    function getPruebasHumano($id) { // probar
        $pruebas['eleccion'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
        respuesta_correcta, respuesta_incorrecta, atributo FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
        JOIN pruebas_eleccion on pruebas_oraculo.id = pruebas_eleccion.id JOIN humano_prueba on 
            pruebas_eleccion.id = humano_prueba.id_prueba WHERE humano_prueba.id_humano = ?', [$id]);

        $pruebas['respLibre'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
        palabras_clave, porcentaje FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
        JOIN pruebas_resp_libre on pruebas_oraculo.id = pruebas_resp_libre.id JOIN humano_prueba on 
            pruebas_resp_libre.id = humano_prueba.id_prueba WHERE humano_prueba.id_humano = ?', [$id]);

        foreach ($pruebas['respLibre'] as $prueba) {
            $prueba->palabras_clave = explode(' ', $prueba->palabras_clave);
        }

        $pruebas['valoracion'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, pruebas_oraculo.pregunta,
        respuesta, atributo FROM pruebas JOIN pruebas_oraculo on pruebas.id = pruebas_oraculo.id
        JOIN pruebas_valoracion on pruebas_oraculo.id = pruebas_valoracion.id JOIN humano_prueba on 
            pruebas_valoracion.id = humano_prueba.id_prueba WHERE humano_prueba.id_humano = ?', [$id]);

        $pruebas['puntuales'] = DB::select('SELECT pruebas.id, pruebas.destino, pruebas.titulo, descripcion, porcentaje, 
            atributo FROM pruebas JOIN pruebas_puntuales on pruebas.id = pruebas_puntuales.id JOIN humano_prueba on 
            pruebas_puntuales.id = humano_prueba.id_prueba WHERE humano_prueba.id_humano = ?', [$id]);

        return response()->json($pruebas, 200);
    }

    public function getHumanosAsig($id) {
        return response()->json(
            DB::select('SELECT humano_prueba.id_humano, humano_prueba.id_prueba FROM humano_prueba JOIN humanos on
            humano_prueba.id_humano = humanos.id_humano WHERE humanos.id_dios = ? ORDER BY id_prueba', [$id]), 200);
    }

    public function asignarPrueba(Request $request) {
        // try {
            DB::table('humano_prueba')->insert([
                'id_humano' => $request->idHumano, 
                'id_prueba' => $request->idPrueba,    
            ]);

            $resp = response()->json(['mensaje' => 'prueba asignada con éxito'], 201);
        // }
        // catch (\Exception $e) {
        //     $resp = response()->json(['mensaje' => 'ha ocurrido un error'], 204);
        // }

        return $resp;
    }

    //UPDATE PRUEBAS

    public function updatePruebaPuntual($id, Request $request) {
        $pGen = Prueba::find($id);
        $pPunt = PruebaPuntual::find($id);

        $pGen->destino = $request->destino;
        $pGen->titulo = $request->titulo;

        $pPunt->descripcion = $request->descripcion;
        $pPunt->porcentaje = $request->porcentaje;
        $pPunt->atributo = $request->atributo;

        try {
            $pGen->save();
            $pPunt->save();
            
            $msg = ['msg' => 'modificado con éxito'];
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = 203;
        }

        return response()->json($msg, $cod);
    }   

    public function updatePruebaEleccion($id, Request $request) {
        $pGen = Prueba::find($id);
        $pOrac = PruebaOraculo::find($id);
        $pElec = PruebaEleccion::find($id);
        
        $pGen->destino = $request->destino;
        $pGen->titulo = $request->titulo;

        $pOrac->pregunta = $request->pregunta;
        
        $pElec->respuesta_correcta = $request->respuestaCorrecta;
        $pElec->respuesta_incorrecta = $request->respuestaIncorrecta;
        $pElec->atributo = $request->atribute;

        try {
            $pGen->save();
            $pOrac->save();
            $pElec->save();
            
            $msg = ['msg' => 'modificado con éxito'];
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = 203;
        }

        return response()->json($msg, $cod);
    }

    // PASAR PRUEBAS

    public function pasarPruebaPuntual($id, Request $request) { // probar
        $especPrueba = DB::select('SELECT pruebas.destino, porcentaje, atributo FROM pruebas JOIN pruebas_puntuales
            on pruebas.id = pruebas_puntuales.id WHERE pruebas.id = ?', [$request->idPrueba])[0];

        $humano = User::find($id);

        $signo = (random_int(0, 100) > $especPrueba->porcentaje - $especPrueba->porcentaje * $humano->{$especPrueba->atributo} / 20) 
            ? 1 : -1;
        $superada = ($signo == 1) ? 1 : 0;

        $humano->humano->destino += $signo * $especPrueba->destino;
        
        try {
            $humano->humano->save();
            DB::select('INSERT INTO humano_prueba (superada) VALUES '.$superada);
            $msg = ['msg' => 'actualizado con éxito'];
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = 400;
        }
        
        return response()->json($msg, $cod);
    }

    public function pasarRespLibre($id, Request $request) { // probar
        $especPrueba = DB::select('SELECT pruebas.destino, palabras_clave, porcentaje FROM pruebas     
            JOIN pruebas_resp_libre on pruebas.id = pruebas_resp_libre.id WHERE pruebas.id = ?', [$request->idPrueba])[0];

        $humano = User::find($id);

        $especPrueba->palabras_clave = explode(' ', $especPrueba->palabras_clave);
        $palabrasPropuestas = explode(' ', $request->palabrasPropuestas);

        $cont = 0;
        foreach ($palabrasPropuestas as $palabraProp) {
            foreach ($especPrueba->palabras_clave as $palabraCorr) {
                if ($palabraProp == $palabraCorr) $cont++;
            }
        }

        $signo = ($cont / sizeof($especPrueba->palabras_clave) >= $especPrueba->porcentaje) ? 1 : -1;

        $superada = ($signo == 1) ? 1 : 0;

        $humano->humano->destino += $signo * $especPrueba->destino;
        
        try {
            $humano->humano->save();
            DB::select('INSERT INTO humano_prueba (superada) VALUES '.$superada);
            $msg = ['msg' => 'actualizado con éxito'];
            $cod = 201;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = 400;
        }
        
        return response()->json($msg, $cod);
    }
}


