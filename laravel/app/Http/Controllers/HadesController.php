<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Humano;
use App\Models\ParametroGeneral;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HadesController extends Controller {
    
    public function matarHumano(Request $request) {
        $h = User::find($request->idHumano);
        $p = ParametroGeneral::find(1);

        $h->humano->cielo_infierno = ($h->destino >= $p->valor) ? 'eliseo' : 'tartaro';

        try {
            $h->humano->save();
            $msg = ['msg' => 'humano muerto'];
            $cod = ['200'];
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'se ha producido un error'];
            $cod = ['203'];
        }

        return response()->json($msg, $cod);
    }

    public function matarHumanosAleatorio(Request $request) {
        $idsHumanos = DB::select('SELECT id FROM users JOIN humanos ON users.id = humanos.id_humano WHERE cielo_infierno IS NULL');
        $p = ParametroGeneral::find(1);

        foreach (array_rand($idsHumanos, $request->nHumanos) as $key) {
            $arrayIds[] = $idsHumanos[$key]->id;
        }

        $humanos = User::findMany($arrayIds);

        
        try {
            foreach ($humanos as $humano) {
                $humano->humano->cielo_infierno = ($humano->humano->destino >= $p->valor) ? 'eliseo' : 'tartaro';
                $humano->humano->save();
            }

            $msg = ['msg' => 'humanos matados con éxito'];
            $cod = 200;
        }
        catch (\Exception $e) {
            $msg = ['msg' => 'ha sucedido un error'];
            $cod = 203;
        }

        return response()->json($msg, $cod);
    }

    public function getMuertos() {
        try {
            $muertos = User::join('humanos', 'users.id', '=', 'humanos.id_humano')
                ->where('cielo_infierno', 'is', 'not null')->get();
            
                $respuesta = [$muertos];
                $cod = 200;
        }
        catch (\Exception $e) {
            $respuesta = ['msg' => 'ha sucedido un error'];
            $cod = 203;
        }

        return response()->json($respuesta, $cod);
    }
}
